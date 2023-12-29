//
//  FilterPredicate.swift
//  CoreData_Starter
//
//  Created by BOMBSGIE on 2023/12/29.
//

import Foundation

enum FilterPredicate {
    case id(_ id: UUID)
    
    var nsPredicate: NSPredicate {
        switch self {
        case .id(let id):
            return NSPredicate(format: format, id as CVarArg)
        }
    }
    
    private var format: String {
        switch self {
        case .id:
            return "id == %@"
        }
    }
}
