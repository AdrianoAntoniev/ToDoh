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

                        let homerImageAttributes = getHomerImageAndSize(basedOn: task.isHighPriority)                        
                        Image(homerImageAttributes.image)
                            .resizable()
                            .frame(width: homerImageAttributes.size.width, height: homerImageAttributes.size.height)
                    }
                }.onDelete(perform: self.deleteItem)
                
            }.navigationBarTitle("ToDoh")
             .navigationBarItems(
                trailing: Button(action: {
                    showForm = true
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.yellow)
                }))
        }
        .sheet(isPresented: $showForm) {
            NewTaskView(model: model)                
        }
    }
    
    private func getHomerImageAndSize(basedOn isHighPriority: Bool) -> (image: String, size: (width: CGFloat, height: CGFloat)){
        if isHighPriority {
            return (image: "homer-crazy", size: (width: 50, height: 50))
        } else {
            return (image: "homer-doh", size: (width: 80, height: 50))
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.model.tasks.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: TaskModel())
    }
}
