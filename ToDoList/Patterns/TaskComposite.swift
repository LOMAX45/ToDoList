//
//  TaskComposite.swift
//  ToDoList
//
//  Created by Максим Лосев on 02.06.2022.
//

import Foundation

protocol Task {
    var name: String { get }
    
    func open()
}

class ConcreteTask: Task {
    var name: String
    var subTasks: ContainerTasks
    
    init(name: String) {
        self.name = name
        self.subTasks = ContainerTasks(name: name)
    }
    
    func open() { }
    
}

class ContainerTasks: Task {
    var name: String
    var containerTasks: [ConcreteTask] = []
    
    init(name: String) {
        self.name = name
    }
    
    func open() { }
    
}





