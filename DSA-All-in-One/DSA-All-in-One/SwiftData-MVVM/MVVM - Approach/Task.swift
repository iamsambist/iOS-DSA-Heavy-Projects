//
//  Task.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 19/08/2025.
//

import Foundation
import SwiftData


@Model
final class TaskModel: Sendable {
    
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = Date()
    }
    
}

protocol TaskDataServiceProtocol {
    
    func fetchTasks() async throws -> [TaskModel]
    func addTask(title: String) async throws
    func updateTask(_ task: TaskModel, title: String) async throws
    func toggleTaskCompletion(_ task: TaskModel) async throws
    func deleteTask(_ task: TaskModel) async throws
    
}

@MainActor
class SwiftDataTaskService: TaskDataServiceProtocol {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchTasks() async throws -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>(
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        return try modelContext.fetch(descriptor)
    }
    
    func addTask(title: String) async throws {
        let newTask = TaskModel(title: title)
        modelContext.insert(newTask)
        try modelContext.save()
    }
    
    func updateTask(_ task: TaskModel, title: String) async throws {
        task.title = title
        try modelContext.save()
    }
    
    func toggleTaskCompletion(_ task: TaskModel) async throws {
        task.isCompleted.toggle()
        try modelContext.save()
    }
    
    func deleteTask(_ task: TaskModel) async throws {
        modelContext.delete(task)
        try modelContext.save()
    }
}

class DIContainer {
    
    static let shared = DIContainer()
    
    private var modelContainer: ModelContainer?
    
    private init() {
        setupModelContainer()
    }
    
    private func setupModelContainer() {
        
        do {
            modelContainer = try ModelContainer(for: TaskModel.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        
    }
    
    @MainActor
    func makeTaskDataService() -> TaskDataServiceProtocol {
        guard let modelContainer = modelContainer else {
            fatalError("ModelContainer not initialized")
        }
        return SwiftDataTaskService(modelContext: modelContainer.mainContext)
    }
    
    @MainActor
    func makeTaskViewModel() -> TaskViewModel {
        return TaskViewModel(dataService: makeTaskDataService())
    }
}

@MainActor
class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
     @Published var isLoading = false
     @Published var errorMessage: String?
     
     private let dataService: TaskDataServiceProtocol
     
     init(dataService: TaskDataServiceProtocol) {
         self.dataService = dataService
     }
     
     // MARK: - Operations
     
     func fetchTasks() {
         Task {
             isLoading = true
             
             do {
                 let fetchedTasks = try await dataService.fetchTasks()
                 await MainActor.run {
                     self.tasks = fetchedTasks
                     self.errorMessage = nil
                 }
             } catch {
                 await MainActor.run {
                     self.errorMessage = "Failed to fetch tasks: \(error.localizedDescription)"
                 }
             }
             
             await MainActor.run {
                 self.isLoading = false
             }
         }
     }
     
     func addTask(title: String) {
         Task {
             do {
                 try await dataService.addTask(title: title)
                 await refreshTasks()
             } catch {
                 await MainActor.run {
                     self.errorMessage = "Failed to add task: \(error.localizedDescription)"
                 }
             }
         }
     }
     
     func toggleTaskCompletion(_ task: TaskModel) {
         Task {
             do {
                 try await dataService.toggleTaskCompletion(task)
                 await refreshTasks()
             } catch {
                 await MainActor.run {
                     self.errorMessage = "Failed to update task: \(error.localizedDescription)"
                 }
             }
         }
     }
     
     func deleteTask(_ task: TaskModel) {
         Task {
             do {
                 try await dataService.deleteTask(task)
                 await refreshTasks()
             } catch {
                 await MainActor.run {
                     self.errorMessage = "Failed to delete task: \(error.localizedDescription)"
                 }
             }
         }
     }
     
     func updateTask(_ task: TaskModel, newTitle: String) {
         Task {
             do {
                 try await dataService.updateTask(task, title: newTitle)
                 await refreshTasks()
             } catch {
                 await MainActor.run {
                     self.errorMessage = "Failed to update task: \(error.localizedDescription)"
                 }
             }
         }
     }
     
     private func refreshTasks() async {
         do {
             let fetchedTasks = try await dataService.fetchTasks()
             await MainActor.run {
                 self.tasks = fetchedTasks
             }
         } catch {
             await MainActor.run {
                 self.errorMessage = "Failed to refresh tasks: \(error.localizedDescription)"
             }
         }
     }
}
