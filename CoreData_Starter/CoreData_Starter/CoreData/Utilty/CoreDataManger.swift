//
//  CoreDataManger.swift
//  CoreData_Starter
//
//  Created by BOMBSGIE on 2023/12/29.
//

import CoreData

final class CoreDataManger {
    static let shared = CoreDataManger()
    
    private let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        self.container = container
    }
}
