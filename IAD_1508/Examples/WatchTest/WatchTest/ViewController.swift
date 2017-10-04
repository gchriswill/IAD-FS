//
//  ViewController.swift
//  WatchTest
//
//  Created by Christopher Gonzalez on 8/15/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    let localTracker = Tracker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var originalPrice = localTracker.cachedPrice()
        
        self.dateLabel.text = "Last Updated \(Tracker.dateFormatter.stringFromDate(localTracker.cachedDate() ))"
        
        self.priceLabel.text = Tracker.priceFormatter.stringFromNumber(originalPrice)
        
        localTracker.requestPrice { (price, error) -> () in
            
            if error == nil {
            
                self.dateLabel.text =
                "Last Updated \(Tracker.dateFormatter.stringFromDate(self.localTracker.cachedDate() ))"
                
                self.priceLabel.text =
                    Tracker.priceFormatter.stringFromNumber(self.localTracker.cachedPrice() )
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

