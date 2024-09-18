//
//  TaskRepository.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 17.09.24.
//

import Foundation

class TaskRepository{
    init(persistence: Persistence = UserDefaultsPersistence()) {
        self.persistence = persistence
        loadTasks()
    }
    
    var tasks: [Task] = []
    private let persistence: Persistence
    private let tasksKey = "tasky-app-tasks"
    
    // salvando usando no userDefaults
    private func savetasks() {
        do{
            let taskData = try JSONEncoder().encode(tasks)
            persistence.saveData(data: taskData, key: tasksKey)
        } catch{
            print("Got an error saving a new task \(error)")
        }
    }
    
    // recuperando os dados do userDefaults, convertendo para o objeto do tipo task usando o decoder
    private func loadTasks() {
        guard let taskData = persistence.loadData(key: tasksKey) else{return}
        do{
            tasks = try JSONDecoder().decode([Task].self, from: taskData)
        } catch {
            print("Got an error saving a new task \(error)")
        }
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
        savetasks()
    }
    
    func removeTask(at index: Int) {
        guard index >= 0, index < tasks.count else{return}
        tasks.remove(at: index)
        savetasks()
    }
    
    func completeTask(at index: Int) {
        guard index >= 0, index < tasks.count else{return}
        tasks[index].isCompleted.toggle()
        savetasks()
    }

}
