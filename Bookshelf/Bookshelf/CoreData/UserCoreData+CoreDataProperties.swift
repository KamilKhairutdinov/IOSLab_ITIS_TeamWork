//
//  UserCoreData+CoreDataProperties.swift
//  Bookshelf
//
//  Created by kerik on 26.05.2024.
//
//

import Foundation
import CoreData

extension UserCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreData> {
        return NSFetchRequest<UserCoreData>(entityName: "UserCoreData")
    }

    @NSManaged public var uid: String
    @NSManaged public var name: String
    @NSManaged public var email: String
    @NSManaged public var avatarData: Data?

}

extension UserCoreData: Identifiable {

}
