//
//  Storer.swift
//  WatchTest
//
//  Created by Christopher Gonzalez on 8/15/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class Storer: NSObject, NSCoding {
    
    var image: UIImage?
    var title: String?
    var date: NSDate?
    
    
    override init() {}
    
    required init(coder aDecoder: NSCoder) {

        if let simage = aDecoder.decodeObjectForKey("simage") as? UIImage,
            let stitle = aDecoder.decodeObjectForKey("stitle") as? String,
            let sdate = aDecoder.decodeObjectForKey("sdate") as? NSDate {
                
                self.image = simage
                self.title = stitle
                self.date = sdate
                
        }
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        if let sprice = self.image,
            let stitle = self.title,
            let sdate = self.date {
                
                aCoder.encodeObject(sprice, forKey: "simage")
                aCoder.encodeObject(sprice, forKey: "stitle")
                aCoder.encodeObject(sprice, forKey: "sdate")
                
        }
        
    }
   
}
