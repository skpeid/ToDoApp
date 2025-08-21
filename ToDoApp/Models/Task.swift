//
//  Task.swift
//  ToDoApp
//
//  Created by Kuanysh Auyelgazy on 20.08.2025.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let priority: TaskPriority
    var isCompleted: Bool = false
}
