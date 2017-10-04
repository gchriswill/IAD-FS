//
//  CWKTableViewCell.swift
//  toptenchar
//
//  Created by Christopher Gonzalez on 8/17/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

import UIKit

class CWKTableViewCell: UITableViewCell {
    
    
    @IBOutlet var charImage: UIImageView!
    @IBOutlet var charName: UILabel!
    @IBOutlet var charRanking: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
