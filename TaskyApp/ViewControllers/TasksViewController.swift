//
//  TasksViewController.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 11.09.24.
//

import UIKit

protocol TaskDelegate: AnyObject {
    func didAddTask(newTask: Task)
}

class TasksViewController: UIViewController {
    
    private var taskRepository: TaskRepository
        
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 24.0
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64.0))
        tableView.tableHeaderView = header
        header.delegate = self
        return tableView
    }()
    
    private lazy var taskIllustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.tasksIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(taskRepository: TaskRepository = TaskRepository()) {
        self.taskRepository = taskRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews() {
        view.addSubview(taskIllustrationImageView)
        view.addSubview(tasksTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            taskIllustrationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tasksTableView.topAnchor.constraint(equalTo: taskIllustrationImageView.bottomAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func didTapCompleteTaskButton(_ sender: UIButton) {
        guard let cell = sender.superview as? UITableViewCell else { return }
        guard let indexPath = tasksTableView.indexPath(for: cell) else { return }
        taskRepository.completeTask(at: indexPath.row)
        tasksTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskRepository.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = taskRepository.tasks[indexPath.row].title
        content.secondaryText = taskRepository.tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckmarkButton(task: taskRepository.tasks[indexPath.row])
        return cell
    }
    
    private func createTaskCheckmarkButton(task: Task) -> UIButton {
        let completeButton = UIButton(type: .system)
        completeButton.addTarget(self, action: #selector(didTapCompleteTaskButton), for: .touchUpInside)
        let symbolName = task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        completeButton.setImage(image, for: .normal)
        completeButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return completeButton
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskRepository.removeTask(at: indexPath.row)
            tasksTableView.reloadData()
        }
    }
}

extension TasksViewController: TasksTableViewHeaderDelegate {
    func didTapAddTaskButton() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.delegate = self
        navigationController?.present(addTaskVC, animated: true)
    }
}

extension TasksViewController: TaskDelegate {
    func didAddTask(newTask: Task) {
        taskRepository.addTask(newTask: newTask)
        tasksTableView.reloadData()
    }
}
