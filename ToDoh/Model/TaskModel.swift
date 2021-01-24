//
//  Task.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 22/01/21.
//

import Foundation

class TaskModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func sortByPriorityAndLexigraphicOrder() {
        let pivot = tasks.partition(by: { $0.isHighPriority } )
        var lowPriorityTasks = tasks[..<pivot].sorted { $0.description < $1.description }
        var highPriorityTasks = tasks[pivot...].sorted { $0.description < $1.description }
        
        tasks = highPriorityTasks + lowPriorityTasks
    }
}

struct Task: Hashable {
    var description: String
    var isHighPriority: Bool
}


