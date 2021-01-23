//
//  NewTask.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 20/01/21.
//

import SwiftUI

struct NewTaskView: View {
    @State private var answer: String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model: TaskModel
            
    var body: some View {
        Form {
            TextField("New Task", text: $answer)
            
            Button(action: {
                model.tasks.append(answer)
                
                presentationMode.wrappedValue.dismiss()
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
