//
//  JokeEntity+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by BOMBSGIE on 2023/12/29.
//
//

import Foundation
import CoreData


extension JokeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JokeEntity> {
        return NSFetchRequest<JokeEntity>(entityName: "JokeEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var category: Int16
    @NSManaged public var body: String?
    @NSManaged public var userRelationship: UserEntity?

}

extension JokeEntity : Identifiable {

}
