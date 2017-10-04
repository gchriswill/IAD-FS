//
//  WKData.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/22/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class WKData: NSDictionary { //"I'm so pro" 

    class func initWithSource()->[String: AnyObject]! {
        
        var source = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("keynames", ofType: "plist")! )!
        
        var mainObject = [String: AnyObject]()
        
        var object = [String: AnyObject]()
        
        for i:Int in 0...9 {
            
            object = [
                
                "simage": UIImagePNGRepresentation( UIImage(named: source["namesForImages"]![i] as! String ) ),
                "sname" : source["namesForCharacters"]![i],
                "srating": "\(i + 1)"
                
            ]
        
            mainObject[object["srating"] as! String] = object
            
        }
        
        println(mainObject)
        
        return mainObject
        
    }
    
}
