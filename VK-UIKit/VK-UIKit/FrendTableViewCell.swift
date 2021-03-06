//
//  FrendTableViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var avatarView: VLAvatarView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func setupUser(user: User?) -> Void {
        guard let frend = user else {
            return
        }
        
        self.fullNameLabel.text = frend.fullName
        self.avatarView.setAvatar(name: frend.avatar ?? "VK_Compact_Logo")
    }
}
