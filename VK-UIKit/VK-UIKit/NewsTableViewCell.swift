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
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var lookButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var lookLabel: UILabel!
    
    let imgNoLike = UIImage(named: "heart-3")?.withRenderingMode(.alwaysOriginal)
    let imgLike = UIImage(named: "heart-1")?.withRenderingMode(.alwaysOriginal)
    let imgComment = UIImage(named: "comments")?.withRenderingMode(.alwaysOriginal)
    let imgLook = UIImage(named: "irritation")?.withRenderingMode(.alwaysOriginal)
    
    
    var userId: Int?
    
    var likeCount = 0 {
        didSet {
            self.likeLabel.text = "\(likeCount)"
        }
    }
   
    var commentCount = 0 {
        didSet {
            self.commentLabel.text = "\(commentCount)"
        }
    }
    
    var lookCount = 0 {
        didSet {
            self.lookLabel.text = "\(lookCount)"
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.commentButton.setImage(self.imgComment, for: .normal)
        self.lookButton.setImage(self.imgLook, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
 
    
    
    
    func setup(id: Int, news: News?) -> Void {
        guard let new = news else {
            return
        }

        userId = id
        
        self.avatarView.setAvatar(name: new.getAutorAvatar())
        self.fullNameLabel.text = new.getAutorFullName()
  
        self.newsTextView.text = new.textNews
        self.newsImageView.image = UIImage(named: new.photo)
        
        self.likeCount = new.likeNamber
        self.commentCount = new.commentNamber
        self.lookCount = new.lookNamber
        
        
        if new.isLiked {
            self.likeButton.setImage(self.imgLike, for: .normal)
            self.likeLabel.textColor = .systemRed
        } else {
            self.likeButton.setImage(self.imgNoLike, for: .normal)
            self.likeLabel.textColor = .black
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.fullNameLabel.text = nil
//        self.avatarView.setAvatar(name: "")
        self.newsTextView.text = nil
        self.newsImageView.image = nil

        self.likeButton.imageView?.image = nil
        self.likeLabel.textColor = nil
        self.likeLabel.text = nil
    }
    
    
    
    
    // MARK: - Action
    //
    @IBAction func likeButtonPress(_ sender: UIButton) {
        guard let id = userId else {
            return
        }
        
        if let user = GlobalDataNews.data.getNews(index: id) {
            if user.isLiked {
                self.likeButton.setImage(self.imgNoLike, for: .normal)
                self.likeLabel.textColor = .black
                likeCount -= 1
            } else {
                self.likeButton.setImage(self.imgLike, for: .normal)
                self.likeLabel.textColor = .systemRed
                likeCount += 1
            }
            GlobalDataNews.data.setLike(index: id)
        }
    }
    
}
