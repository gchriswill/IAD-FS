//
//  ListViewController.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/17/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class CWKListViewController: UIViewController {
    
    var objects = [ [String:Character] ]()

    @IBOutlet var listTableView: CWKTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //println(objects)
        
        (listTableView.dataSource as! CWKListDataSource).source = objects
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
