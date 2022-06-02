//
//  ToDoListController.swift
//  ToDoList
//
//  Created by Максим Лосев on 02.06.2022.
//

import UIKit

class ToDoListController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var tasks = container1
    
    
    //MARK: - Lyfecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tasks.containerTasks = [task1,task2,task3]
        
    }
    
    //MARK: - Functions

    

}

//MARK: - TableView functions

extension ToDoListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let numberOfRows = tasks.containerTasks.count else {
//            return 1
//        }
//        return numberOfRows
        tasks.containerTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.task = tasks.containerTasks[indexPath.row]
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "toDoListController") as? ToDoListController else { return }
        controller.tasks = tasks.containerTasks[indexPath.row].subTasks
        navigationController?.pushViewController(controller, animated: true)
    }
}
