//
//  Persistence.swift
//  TodoApp
//
//  Created by 유승철 on 2/8/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Todo")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
