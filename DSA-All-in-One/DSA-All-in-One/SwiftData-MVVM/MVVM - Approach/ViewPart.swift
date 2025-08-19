

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel: TaskViewModel = DIContainer.shared.makeTaskViewModel()
    @State private var showingAddTask = false
    
//    init(viewModel: TaskViewModel? = nil) {
//            _viewModel = StateObject(wrappedValue: viewModel ?? DIContainer.shared.makeTaskViewModel())
//        }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading tasks...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(viewModel.tasks) { task in
                            TaskRowView(
                                task: task,
                                onToggle: { viewModel.toggleTaskCompletion(task) },
                                onDelete: { viewModel.deleteTask(task) }
                            )
                        }
                    }
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Task") {
                        showingAddTask = true
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView { title in
                    viewModel.addTask(title: title)
                }
            }
        }
        .onAppear {
            viewModel.fetchTasks()
        }
    }
}

struct TaskRowView: View {
    let task: TaskModel
    let onToggle: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted)
                Text(task.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button("Delete", action: onDelete)
                .foregroundColor(.red)
        }
        .padding(.vertical, 4)
    }
}


struct AddTaskView: View {
    @State private var title = ""
    @Environment(\.dismiss) private var dismiss
    let onSave: (String) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $title)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !title.isEmpty {
                            onSave(title)
                            dismiss()
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
