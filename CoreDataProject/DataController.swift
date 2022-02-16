//
//  DataController.swift
//  CoreDataProject
//
//  Created by Alex Paz on 16/02/2022.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
