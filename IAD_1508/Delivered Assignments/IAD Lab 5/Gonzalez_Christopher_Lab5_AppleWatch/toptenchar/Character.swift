//
//  Character.swift
//  
//
//  Created by Christopher Gonzalez on 8/15/15.
//
//

import Foundation
import CoreData

class Character: NSManagedObject {

    @NSManaged var image: String
    @NSManaged var name: String
    @NSManaged var rating: NSNumber

}
