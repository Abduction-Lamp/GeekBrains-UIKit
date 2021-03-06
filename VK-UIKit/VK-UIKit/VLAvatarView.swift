//
//  VLAratarView.swift
//  VK-UIKit
//
//  Created by Владимир on 04.03.2021.
//

import UIKit

class VLAvatarView: UIView {

    var offset: CGFloat = 2.0
    var radius: CGFloat!

    
    var contentShadowView: UIView! {
        didSet {
            contentShadowView.layer.shadowOffset = CGSize(width: 2, height: 1)
            contentShadowView.layer.shadowOpacity = 0.5
            contentShadowView.layer.shadowRadius = 2
            contentShadowView.backgroundColor = .clear
        }
    }
    
    var contentAvatarImageView: UIImageView! {
        didSet {
            contentAvatarImageView.clipsToBounds = true
            contentAvatarImageView.backgroundColor = .white
        }
    }
    

    func layoutContent() {
        
        contentShadowView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset).isActive = true
        contentShadowView.widthAnchor.constraint(equalToConstant: radius).isActive = true
        contentShadowView.heightAnchor.constraint(equalToConstant: radius).isActive = true
        contentShadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        contentAvatarImageView.widthAnchor.constraint(equalToConstant: radius).isActive = true
        contentAvatarImageView.heightAnchor.constraint(equalToConstant: radius).isActive = true
        contentAvatarImageView.centerXAnchor.constraint(equalTo: contentShadowView.centerXAnchor).isActive = true
        contentAvatarImageView.centerYAnchor.constraint(equalTo: contentShadowView.centerYAnchor).isActive = true
    }
    
    func setup() {
        
        radius = self.bounds.height - 2 * offset
        
        contentShadowView = UIView()
        contentShadowView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentShadowView)
        
        contentAvatarImageView = UIImageView()
        contentAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentAvatarImageView)
        
        layoutContent()
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        contentShadowView.layer.shadowPath = UIBezierPath(ovalIn: contentShadowView.bounds).cgPath
        contentAvatarImageView.layer.cornerRadius = radius / 2
    }
    

    // MARK: - Gesture Recognizer
    //
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
    
    @objc func onTap() {
        
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")

        springAnimation.fromValue = 0
        springAnimation.toValue = 1
        springAnimation.stiffness = 200
        springAnimation.mass = 0.9
        springAnimation.duration = 2
        
        self.layer.add(springAnimation, forKey: nil)
    }
    
    
    // MARK: - INIT
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
        addGestureRecognizer(tapGestureRecognizer)
    }
    

    // MARK: - Data Access
    //
    func setAvatar(name: String) {
        self.contentAvatarImageView.image = UIImage(named: name)
    }
}
