//
//  NewTask.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 20/01/21.
//

import SwiftUI

struct NewTaskView: View {
    @State private var task: String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model: TaskModel
            
    var body: some View {
        Form {
            TextField("Fill in with a new task", text: $task)
            Button(action: {
                if !task.isBlankText() {
                    task = task.trimmingCharacters(in: .whitespaces)
                    
                    model.tasks.append(Task(description: task, isDone: false))
                    
                    presentationMode.wrappedValue.dismiss()
                }                
            }, label: {
                Text("OK")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.green)
            })
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(model: TaskModel())
    }
}

