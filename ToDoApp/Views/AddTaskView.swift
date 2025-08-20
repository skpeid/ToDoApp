//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Kuanysh Auyelgazy on 20.08.2025.
//

import SwiftUI

struct AddTaskView: View {
    @State var title: String = ""
    @State var selectedPriority: TaskPriority = .normal
    
    @Binding var tasks: [Task]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Title")
                .fontWeight(.semibold)
                .padding(.top)
            TextField("Task Title", text: $title)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Text("Priority")
                .fontWeight(.semibold)
            Picker("Choose Priority", selection: $selectedPriority) {
                ForEach(TaskPriority.allCases) { priority in
                    Text(priority.title)
                        .tag(priority)
                }
            }
            .padding(.bottom)
            Button {
                let newTask = Task(title: title, priority: selectedPriority)
                tasks.append(newTask)
                dismiss()
            } label: {
                Text("Add Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.green)
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .bold))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Spacer()

        }
        .padding(.horizontal)
    }
}

#Preview {
    AddTaskView(tasks: .constant([]))
}
