//
//  CWKListDataSource.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/17/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class CWKListDataSource: NSObject, UITableViewDataSource {
    
    var source = [ [String:Character] ]()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return source.count }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return "Characters" }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return source[section].count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: CWKTableViewCell = {
            
            var c = tableView.dequeueReusableCellWithIdentifier("idCell") as? CWKTableViewCell
            var o = self.source[indexPath.section]["\(indexPath.row + 1)"]!
            
            c?.charImage.image = UIImage(data: o.image )
            c?.charName.text = o.name
            c?.charRanking.text = o.rating
            
            return c!
            
        }()
        
        return cell
        
    }
   
}
