//
//  TaskPriority.swift
//  ToDoApp
//
//  Created by Kuanysh Auyelgazy on 20.08.2025.
//

import SwiftUI

enum TaskPriority: CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case normal
    case urgent
    case optional
    
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .urgent:
            return "Urgent"
        case .optional:
            return "Optional"
        }
    }
    
    var color: Color {
        switch self {
        case .normal:
            return .blue.opacity(0.5)
        case .urgent:
            return .pink.opacity(0.5)
        case .optional:
            return .green.opacity(0.5)
        }
    }
}
