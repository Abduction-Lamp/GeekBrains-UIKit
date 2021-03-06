//
//  TestClassTableViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 05.03.2021.
//

import UIKit

class TestClassTableViewCell: UITableViewCell {

    

    
    
    var textBoxView: UIView!
    var newsTextView: UITextView!
    
    var loadingAnimationView: LoadingAnimationView!
    var newsImageView: UIImageView!
    
    
    var userActionBoxView: UIView!
    var heightUserActionBoxView: CGFloat!
    
    var likeButton: UIButton!
    var commentButton: UIButton!
    var lookButton: UIButton!
    var likeLabel: UILabel!
    var commentLabel: UILabel!
    var lookLabel: UILabel!
    
    
    
    
    // MARK: -  Heade Box View
    //          Служит как контейнер, в котором лежит аватарка и имя
    //
    private var headerBoxView: UIView!
    private var heightHeaderBoxView: CGFloat = 55
    
    private var avatarView: VLAvatarView!
    private var widthAvatarView: CGFloat = 60
    private var heightAvatarView: CGFloat = 50
    
    private var fullNameLabel: UILabel!
    private var heightFullNameLabel: CGFloat = 50
    
    
    private func layoutHeaderBoxView(topAnchor: UIView) {
        
        headerBoxView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        headerBoxView.topAnchor.constraint(equalTo: topAnchor.topAnchor).isActive = true
        headerBoxView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        headerBoxView.heightAnchor.constraint(equalToConstant: heightHeaderBoxView).isActive = true
        
        avatarView.leftAnchor.constraint(equalTo: headerBoxView.leftAnchor, constant: 5.0).isActive = true
        avatarView.topAnchor.constraint(equalTo: headerBoxView.topAnchor, constant: 5.0).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: widthAvatarView).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: heightAvatarView).isActive = true
        
        fullNameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: headerBoxView.topAnchor).isActive = true
        fullNameLabel.rightAnchor.constraint(equalTo: headerBoxView.rightAnchor).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: heightFullNameLabel).isActive = true
    }
    
    func setupHeaderBoxView(topAnchor: UIView) {

        headerBoxView = UIView()
        headerBoxView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(headerBoxView)
        
        avatarView = VLAvatarView(frame: CGRect(x: 0, y: 0, width: widthAvatarView, height: heightAvatarView))
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        self.headerBoxView.addSubview(avatarView)
        
        fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headerBoxView.addSubview(fullNameLabel)
        
        
        layoutHeaderBoxView(topAnchor: topAnchor)
        

        self.avatarView.setAvatar(name: "avatar001")
        self.fullNameLabel.text = "Petr Sedov"
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.avatarView.setAvatar(name: "")
        self.fullNameLabel.text = nil
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHeaderBoxView(topAnchor: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupHeaderBoxView(topAnchor: self.contentView)
    }
    
}
