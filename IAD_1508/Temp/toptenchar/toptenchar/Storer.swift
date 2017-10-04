//
//  Storer.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/15/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit
import CoreData


// MARK:

/* 

MARK: CoreData Custom Management Class

*/
/**

Custom CoreData manager and storer class for manipulating CoreData's entities and store DB with the following features:

- Inserting
- Retriving
- Saving

**IMPORTANT NOTE ⚠️** At this point, all data received through this class functions MUST NEVER be nil nor empty...

**👤 USER:** @gchriswill

*/

class Storer: NSObject {
    
    
    //MARK:
    /*
    
    MARK: 📖 MOC Insert Objects Function
    
    */
    /**
    
    This function has been made to insert a single Character object. It accepts a dictionary which values
    will be unwrapped to use them as a source for setting the CoreData's Character object class values.
    It returns true if the operation was successful, otherwise false.
    
    **👤 USER:** @gchriswill
    
    :param: context The Mananged Object Context of the persistentStoreCoordinator wich is the Persistent Store Coordinator
            for the application.
    
    :returns: true if the INSERT operation was successful. Otherwise false and outputs the recieved object to the cosonle
    
    */
    
    class func insertObject(FromDictionary collection: [String : AnyObject],
    ForManagedObjectContext context: NSManagedObjectContext ) -> Bool {

        println("\n Storer Log:---> Storer//insertObject ::: " +
            "Attemting to INSERT Character object to CoreData DB \n")
        
        if collection.count > 10 { return false }
        
        if let simage   = collection["simage"] as? NSData,
            let stitle  = collection["sname"] as? String,
            let srating = collection["srating"] as? String {
        
                var chars = NSEntityDescription.insertNewObjectForEntityForName("Character",
                    inManagedObjectContext: context) as! Character
                
                chars.image     = simage
                chars.name      = stitle
                chars.rating    = srating
                
                println("\n Storer Log:---> Storer//insertObject ::: " +
                    "Object Character added to DB \n")
                
                // Returning true because the INSERT was successfull
                return true
                
        }
            
        println("\n Storer Log:---> Storer//insertObject ::: " +
            "COULDN'T INSERT TO CoreData DB \n Message -> Object is invalid: \(collection) ")
        
         // Returning false because if runtime execution reachs this return statement, then means
        // that the INSERT was unsuccessfull

        return false

    }// End of insertObject method
    
    
    //MARK:
    /*
    
    MARK: 📖 MOC Save Function
    
    */
    /**
    
    This function has been made to retrieve all stored objects from CoreData's database. It returns an
    array containing unwrapped Character objects, but nil if the fetch was unsuccessful. Also, provides
    an executable area to implement custon behavior for handling an empty results array.
    
    **👤 USER:** @gchriswill

    :param: context The Mananged Object Context of the persistentStoreCoordinator wich is the Persistent Store Coordinator
                    for the application.
    
    :returns: true if the SAVE operation was successful. Otherwise false, and will print the error log.
    
    */
    
    class func saveStorerToContext(#context: NSManagedObjectContext) -> Bool {
        
        var err: NSError? = nil
        
        if context.save(&err) {
            
            println("\n Storer Log:---> Storer//saveStorer ::: " +
                "Objects saved to CoreData DB \n")
            
            // Returning true because save was successfull
            return true
            
        }else{
            
            println(err)
            println("\n Storer Log:---> Storer//saveStorer ::: " +
                "COULDN'T SAVE TO CoreData DB \n \n")
            
            // Returning false because if runtime execution reachs this return statement, then means
            // that the SAVE was unsuccessfull
            
            return false
            
        }
        
    }// End of saveStorerToContext method
    
    
    //MARK:
    /* 
    
    MARK: 📖 MOC Retrive Objects Function
    
    */
    /**
    
    This class function has been made to retrieve all stored objects from CoreData's database. It returns an
    array containing unwrapped Character objects, but nil if the fetch was unsuccessful. Also, provides
    an executable area to implement custon behavior for handling an empty results array.
    
    **👤 USER:** @gchriswill
    
    :param: context The Mananged Object Context of the persistentStoreCoordinator wich is the Persistent Store Coordinator
                    for the application.
    
    :returns: A dictionary object containing the number position as String for indexing and the character objects as values.
    
    */
    
    class func retrieveObjects(FromManagedObjectContext context: NSManagedObjectContext,
        AsFaults fault:Bool) -> [String: Character]? {

            println("\n Storer Log:---> Storer//retrieveImageObjects ::: " +
            "Attempting to RETRIEVE Character objects from CoreData DB \n")

            var err:NSError? = nil
            var req = context.persistentStoreCoordinator!.managedObjectModel.fetchRequestTemplateForName("CharFetchRequest")!
            var res = context.executeFetchRequest(req, error: &err) as! [Character]
            
            if res.isEmpty || err != nil {
    
                println("\n Storer Log:---> There is nothing to retrieve or there is an err: \n" +
                    "Error: \(err)")
                
                println("Array: \(res)" )
    
                // Code for handling no results goes here...
                
                return nil
                
            }else{
                
                var items = [String: Character](); for c:Character in res { items[c.rating] = c };
                
                println("\n Storer Log:---> CDMananger//retrieveImageObjects ::: " +
                    "Retreived Character Objects from CoreData DB successfully \n")
                
                return items

            }
            
    }// End of retrieveObjects method
    
} // End of Storer class



