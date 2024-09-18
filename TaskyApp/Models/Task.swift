//
//  Task.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 11.09.24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}

