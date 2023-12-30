//
//  FilterPredicate.swift
//  CoreData_Starter
//
//  Created by BOMBSGIE on 2023/12/29.
//

import Foundation

enum FilterPredicate {
    case id(_ id: UUID)
    case filteredJoke(id: UUID, category: Int16)
    
    var nsPredicate: NSPredicate {
        switch self {
        case .id(let id):
            return NSPredicate(format: format, id as CVarArg)
        case .filteredJoke(let id, let category):
            return NSPredicate(format: format, id as CVarArg, category as CVarArg)
        }
    }
    
    private var format: String {
        switch self {
        case .id:
            return "id == %@"
        case .filteredJoke:
            return "userRelationship.id == %@ && category == %i"
        }
    }
}
