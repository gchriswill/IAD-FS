//
//  WKDetailViewController.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/22/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit
import WatchKit

class WKDetailViewController: WKInterfaceController {

    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var name: WKInterfaceLabel!
    @IBOutlet var rating: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        context?["simage"]
        
        // Configure interface objects here.
        
        image.setImageData( context?["simage"] as? NSData )
        
        name.setText( context?["sname"] as? String )
        
        rating.setText( context?["srating"] as? String )
        
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
