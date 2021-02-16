//
//  FrendTableViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var shadow: ShadowView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
