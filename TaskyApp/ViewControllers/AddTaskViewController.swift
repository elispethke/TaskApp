//
//  AddTaskViewController.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 16.09.24.
//

import UIKit

class AddTaskViewController: UIViewController {
    weak var delegate: TaskDelegate?
    
    private var addNewTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add Task"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
        
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.text = "Titulo"
        return label
        
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Titulo da Tarefa"
        textField.borderStyle = .roundedRect
        return textField
        
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.text = "Description"
        return label
        
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField  = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Task Description"
        textField.borderStyle = .roundedRect
        return textField
        
    }()
    
    private lazy var saveTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(didTapSaveTaskButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        view.addSubview(addNewTaskLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTaskButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addNewTaskLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32.0),
            addNewTaskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: addNewTaskLabel.bottomAnchor, constant: 24.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 44.0),
            
            saveTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            saveTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func didTapSaveTaskButton() {
            guard let title = titleTextField.text,!title.isEmpty else {
                print("You need a title")
                return
            }
                    
            let newTask = Task(title: title, description: descriptionTextField.text)
            
                delegate?.didAddTask(newTask: newTask)
                
                dismiss(animated: true)
        }
        
    }

