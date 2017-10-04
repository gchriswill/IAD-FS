//
//  InterfaceController.swift
//  WatchTest WatchKit Extension
//
//  Created by Christopher Gonzalez on 8/15/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var priceLabel: WKInterfaceLabel!
    @IBOutlet weak var dateLabel: WKInterfaceLabel!
    
    let localTracker = Tracker()
    var updating = false

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        updatePrice(localTracker.cachedPrice() )
        updateDate(localTracker.cachedDate() )
        
        // Configure interface objects here.
    }
    
    private func updatePrice(price:NSNumber){
        priceLabel.setText(Tracker.priceFormatter.stringFromNumber(price) )
    }

    private func updateDate(date:NSDate){
        dateLabel.setText("Last Updated \(Tracker.dateFormatter.stringFromDate(date) )" )
    }
    
    private func update(){
        
        if !updating {
            updating = true
            let originalPrice = localTracker.cachedPrice()
            
            localTracker.requestPrice({ (price, error) -> () in
                
                if error == nil {
                        self.updatePrice(price!)
                        self.updateDate(NSDate() )
                }
                self.updating = false
                
            })
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        update()
        
    }
    
    @IBAction func refreshTapped() {
        
        update()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
