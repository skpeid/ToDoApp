//
//  ContentView.swift
//  ToDoApp
//
//  Created by Kuanysh Auyelgazy on 20.08.2025.
//

import SwiftUI

struct TasksView: View {
    @State var tasks: [Task] = [
        Task(title: "Finish coding course", priority: .normal, isCompleted: false),
        Task(title: "Brush teeth", priority: .urgent, isCompleted: true),
        Task(title: "walk dog", priority: .optional)
    ]
    
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskView(task: task)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    showAddTaskView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 22))
                        .foregroundStyle(.black)
                }
                
            }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView(tasks: $tasks)
                .presentationDetents([.height(300)])
        }
    }
}

#Preview {
    TasksView()
}

struct TaskView: View {
    let task: Task
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
            Text(task.title)
                .font(.system(size: 18))
            Spacer()
            Text(task.priority.title)
                .foregroundStyle(.black.opacity(0.5))
                .fontWeight(.bold)
                .padding(.horizontal)
                .frame(height: 30)
                .background(task.priority.color)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}
