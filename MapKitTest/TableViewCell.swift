//
//  TableViewCell.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var addresslabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
