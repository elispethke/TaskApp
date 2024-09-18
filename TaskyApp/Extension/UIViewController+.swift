//
//  UIViewController+.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 10.09.24.
//

import UIKit
extension UIViewController {
    func addGradientBackground() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilac)?.cgColor ?? UIColor.purple.cgColor]
        view.layer.insertSublayer(gradientBackground, at: 0)
    }
    
}
