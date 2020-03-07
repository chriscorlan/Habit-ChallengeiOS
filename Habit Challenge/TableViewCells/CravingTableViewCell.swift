//
//  CravingTableViewCell.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 4/28/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class CravingTableViewCell: UITableViewCell {

    @IBOutlet weak var cravingLevelLabel: UILabel!
    @IBOutlet weak var cravingNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
