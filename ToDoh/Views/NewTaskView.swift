//
//  NewTask.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 20/01/21.
//

import SwiftUI

struct NewTaskView: View {
    @State private var task: String = ""
    @State private var isHighPriority: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model: TaskModel
            
    var body: some View {
        Form {
            TextField("Fill in with a new task", text: $task)
            Toggle(isOn: $isHighPriority, label: {
                Text("High priority")
            })
            Button(action: {
                if !task.isBlankText() {
                    presentationMode.wrappedValue.dismiss()
                    
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        task = task.trimmingCharacters(in: .whitespaces)
                        model.tasks.append(Task(description: task, isHighPriority: isHighPriority))
                        model.save()
                    }
                }
            }, label: {
                Text("OK")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.yellow)
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            
            
            Spacer(minLength: 100)
                        
            let homerPhases = getHomerImageAndTextBasedOnNumberOfTasks()
            Image(homerPhases.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .border(Color.yellow)
            
            Spacer(minLength: 50)
            
            Text(homerPhases.phrase)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                .font(.title)
        }                
    }
    
    func getHomerImageAndTextBasedOnNumberOfTasks() -> (phrase: String, imageName: String) {
        let numberOfTasks = self.model.tasks.count
        
        switch numberOfTasks {
        case 0:
            return (phrase: "You have no tasks, dude!", imageName: "homer-blah")
        case 1:
            return (phrase: "You have one task, man! Don't you forget it!", imageName: "homer-donuts")
        case 2:
            return (phrase: "D'oh! You have two tasks already!", imageName: "homer-doh")
        default:
            return (phrase: "Dude, you have more than two tasks to do! Is it a good idea add one more?", imageName: "homer-crazy")
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(model: TaskModel())
    }
}

