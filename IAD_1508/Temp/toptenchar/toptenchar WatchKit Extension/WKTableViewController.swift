//
//  WKTableViewController.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/22/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit
import WatchKit

class WKTableViewController: WKInterfaceController {

    @IBOutlet var tableView: WKInterfaceTable!
    
    var data = [String : AnyObject]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        WKInterfaceController.openParentApplication(["":""], reply: {         (extractdData, error) -> Void in
            
            self.data = (extractdData as! [String: AnyObject])
            //println( self.data["1"]!)
            
            self.tableView.setNumberOfRows( self.data.count,
                withRowType: "wkcell")
            
            var rowcount = self.tableView.numberOfRows
            
            for index in 0..<rowcount {
                
                var row = self.tableView.rowControllerAtIndex(index) as! WKRowController
                
                var name = self.data["\(index + 1)"]?["sname"] as! String
                
                row.rowTitle.setText( name )
                
            }
    
        })
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {

        return self.data["\(rowIndex + 1)"]
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    


}
