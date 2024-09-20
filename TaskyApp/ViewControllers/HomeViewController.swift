//
//  ViewController.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 10.09.24.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainIllustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.homeIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var getreadylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prepare to conquer the day, one list at a time."
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's start!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .bold)
        button.backgroundColor = UIColor(named: AssetsConstants.darkPurple)
        button.layer.cornerRadius = 12.0
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground()
        addSubView()
        setupConstraints()
    }
    
    @objc func didTapGetStartedButton() {
        navigationController?.pushViewController(TasksViewController(), animated: true)
    }
    
    // adicionando as imagens na tela
    private func addSubView() {
        view.addSubview(logoImageView)
        view.addSubview(mainIllustrationImageView)
        view.addSubview(getreadylabel)
        view.addSubview(getStartedButton)
    }
    // adicionando as constrainsts
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0), // Adiciona espaço no topo
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centraliza no eixo X
            logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 14.0), // Limita a largura da logo nas laterais
            logoImageView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -14.0), // Limita a largura da logo nas laterais
            logoImageView.heightAnchor.constraint(equalToConstant: 80), // Ajusta a altura da logo
            
            mainIllustrationImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8.0),
            mainIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getreadylabel.topAnchor.constraint(equalTo: mainIllustrationImageView.bottomAnchor, constant: 32.0),
            getreadylabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26.0),
            getreadylabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26.0),
            
            getStartedButton.topAnchor.constraint(equalTo: getreadylabel.bottomAnchor, constant: 32.0),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 172.0),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44.0),
            
        ])
    }
    
    
}

