//
//  UserEntity+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by BOMBSGIE on 2023/12/29.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var jokeRelationship: NSSet?

}

// MARK: Generated accessors for jokeRelationship
extension UserEntity {

    @objc(addJokeRelationshipObject:)
    @NSManaged public func addToJokeRelationship(_ value: JokeEntity)

    @objc(removeJokeRelationshipObject:)
    @NSManaged public func removeFromJokeRelationship(_ value: JokeEntity)

    @objc(addJokeRelationship:)
    @NSManaged public func addToJokeRelationship(_ values: NSSet)

    @objc(removeJokeRelationship:)
    @NSManaged public func removeFromJokeRelationship(_ values: NSSet)

}

extension UserEntity : Identifiable {

}
