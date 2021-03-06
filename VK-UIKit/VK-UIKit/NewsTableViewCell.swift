//
//  NewsTableViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 25.02.2021.
//

import UIKit


class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var avatarView: VLAvatarView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var newsTextView: UITextView!
    
    @IBOutlet weak var newsImageView: ImageWithLoadingAnimationView!
//    var loadingAnimationView: LoadingAnimationView!
    
    
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
    
    var flag = false
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
//        self.likeButton.layer.shadowOpacity = 0

        
        
//        self.newsImageView = ImageWithLoadingAnimationView(
//            frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width)
//        )
//        self.contentStackView.insertArrangedSubview(self.newsImageView, at: 2)
//        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.newsImageView.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor).isActive = true
//        self.newsImageView.trailingAnchor.constraint(equalTo: self.contentStackView.trailingAnchor).isActive = true
//        self.newsImageView.heightAnchor.constraint(equalToConstant: self.contentStackView.bounds.width).isActive = true
        
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
        self.newsImageView.setImage(name: new.photo)

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
        self.avatarView.setAvatar(name: "")
        
        self.newsTextView.text = nil
        
        self.newsImageView.setImage(name: nil)
        self.newsImageView.isLoaded = false
        
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
                UIView.transition(
                    with: likeButton,
                    duration: 1.0,
                    options: [.transitionCurlUp, .curveEaseOut],
                    animations: {
                        self.likeButton.setImage(self.imgNoLike, for: .normal)
                    },
                    completion: nil
                )
                UIView.transition(
                    with: likeLabel,
                    duration: 1.0,
                    options: [.transitionCurlUp, .curveEaseOut],
                    animations: {
                        self.likeLabel.textColor = .black
                    },
                    completion: nil
                )
                likeCount -= 1
            } else {
                UIView.transition(
                    with: likeButton,
                    duration: 1.0,
                    options: [.transitionCurlDown, .curveEaseOut],
                    animations: {
                        self.likeButton.setImage(self.imgLike, for: .normal)
                    },
                    completion: nil
                )
                UIView.transition(
                    with: likeLabel,
                    duration: 1.0,
                    options: [.transitionCurlDown, .curveEaseOut],
                    animations: {
                        self.likeLabel.textColor = .systemRed
                    },
                    completion: nil
                )
                likeCount += 1
            }
            GlobalDataNews.data.setLike(index: id)
        }
    }
    
}
