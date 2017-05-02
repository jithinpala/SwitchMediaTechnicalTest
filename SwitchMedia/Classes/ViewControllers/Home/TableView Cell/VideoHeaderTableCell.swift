//
//  VideoHeaderTableCell.swift
//  SwitchMediaTechnicalTest
//
//  Created by Jithin on 1/5/17.
//  Copyright © 2017 Jithinpala. All rights reserved.
//

import UIKit

class VideoHeaderTableCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initialize()
    }
    
    func initialize() {
        headerLabel.textColor = UIColor.appTableHeaderTitleColor()
    }
    
    func updateTableHeaderText(section: Int) {
        switch section {
        case 0:
            headerLabel.text = TableHeaderLabel.First.rawValue
            break
        case 1:
            headerLabel.text = TableHeaderLabel.Second.rawValue
            break
        case 2:
            headerLabel.text = TableHeaderLabel.Third.rawValue
            break
        default:
            return
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
