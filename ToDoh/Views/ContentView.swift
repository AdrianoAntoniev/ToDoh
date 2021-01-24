//
//  ContentView.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 20/01/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var showForm = false
    @ObservedObject var model: TaskModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.tasks, id: \.self) { task in
                    HStack {
                        Text(task.description)
                        Spacer()
                        Image(systemName: (task.isHighPriority ? "exclamationmark.3" : "exclamationmark"))
                    }
                }
            }.navigationBarTitle("ToDoh")
             .navigationBarItems(
                trailing: Button(action: {
                    showForm = true
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }))
        }
        .sheet(isPresented: $showForm) {
            NewTaskView(model: model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: TaskModel())
    }
}
