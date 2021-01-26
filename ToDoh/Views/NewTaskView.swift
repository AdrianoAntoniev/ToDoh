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
                    task = task.trimmingCharacters(in: .whitespaces)
                    model.tasks.append(Task(description: task, isHighPriority: isHighPriority))
                    
                    model.sortByPriorityAndLexigraphicOrder()
                    
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("OK")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.yellow)
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        }                
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(model: TaskModel())
    }
}

