//
//  TaskCell.swift
//  ToDoList
//
//  Created by Максим Лосев on 02.06.2022.
//

import UIKit

class TaskCell: UITableViewCell, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var bodyTaskTextField: UITextField!
    @IBOutlet weak var quantitySubtasksLabel: UILabel!
    
    //MARK: - Properties
    
    var task: ConcreteTask?
    
    func configure() {
        bodyTaskTextField.delegate = self
        guard let name = task?.name,
        let count = task?.subTasks.containerTasks.count else { return }
        bodyTaskTextField.text = name
        quantitySubtasksLabel.text = "\(count)"
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
