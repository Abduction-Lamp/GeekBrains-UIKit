//
//  NewsTableViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 25.02.2021.
//

import UIKit


class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsActionView: NewsButtonActionViewControll!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
 
    
    func setup(news: News?) -> Void {
        
        guard let new = news else {
            return
        }
        self.fullNameLabel.text = new.getAutorFullName()
        self.avatarView.setAvatar(name: new.getAutorAvatar())
        self.newsTextView.text = new.textNews
        self.newsImageView.image = UIImage(named: new.photo)
        
        self.newsActionView.likeCount = new.likeNamber
        self.newsActionView.commentCount = new.commentNamber
        self.newsActionView.lookCount = new.lookNamber
    }
}
