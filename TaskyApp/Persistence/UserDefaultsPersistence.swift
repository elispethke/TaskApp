//
//  UserDefaultsPersistence.swift
//  TaskyApp
//
//  Created by Elisangela Pethke on 17.09.24.
// Esse arquivo vai lidar com a persistencia atravez do userDefaults 

import Foundation

protocol Persistence {
    func saveData(data: Data, key: String)
    func loadData(key: String) -> Data?
}

class UserDefaultsPersistence: Persistence {
    func saveData(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
    
    
}
