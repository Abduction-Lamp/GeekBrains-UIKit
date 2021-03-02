//
//  AvatarView.swift
//  VK-UIKit
//
//  Created by Владимир on 26.02.2021.
//

import UIKit

class AvatarView: UIView {

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    

    @IBOutlet weak var avatar: UIImageView!
    
    
    
    var radius: CGFloat = 20
    var shadowColor = UIColor.black
    var shadowOpacity: Float = 0.5
    var shadowOffset = CGSize(width: 2, height: 1)
    
    
    
    // MARK: -
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let maskLayer = CAShapeLayer()
        
        let objPath = UIBezierPath()
        objPath.addArc(withCenter: CGPoint(x: radius+1, y: 22), radius: radius, startAngle: 0, endAngle: 360, clockwise: true)
        maskLayer.path = objPath.cgPath
        maskLayer.shadowOpacity = shadowOpacity
        maskLayer.shadowOffset = shadowOffset
        self.layer.mask = maskLayer
        
        let blacLayer = CALayer()
        blacLayer.backgroundColor = shadowColor.cgColor
        self.layer.addSublayer(blacLayer)
        blacLayer.frame = self.bounds

        
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = radius
        avatar.layer.backgroundColor = UIColor.white.cgColor
        self.addSubview(avatar)
    }
    
    
    
    func setAvatar(name: String) {
        self.avatar.image = UIImage(named: name)
    }
}
