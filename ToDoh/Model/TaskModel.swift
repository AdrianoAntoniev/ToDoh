//
//  Task.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 22/01/21.
//

import Foundation

class TaskModel: ObservableObject {
    @Published var tasks: [Task] = []
}

struct Task: Hashable {
    var description: String
    var isDone: Bool
}

