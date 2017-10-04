//
//  Character.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/15/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import Foundation
import CoreData

class Character: NSManagedObject, NSCoding {

    @NSManaged var image: NSData
    @NSManaged var name: String
    @NSManaged var rating: String
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        
        if let simage = aDecoder.decodeObjectForKey("simage") as? NSData,
            let sname = aDecoder.decodeObjectForKey("stitle") as? String,
            let srating = aDecoder.decodeObjectForKey("srating") as? String {
                
                image = simage
                name = sname
                rating = srating
                
        }
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
                aCoder.encodeObject(self.image, forKey: "simage")
                aCoder.encodeObject(self.name, forKey: "stitle")
                aCoder.encodeObject(self.rating, forKey: "srating")
        
    }
    
}
