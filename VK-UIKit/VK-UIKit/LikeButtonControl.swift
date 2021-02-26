//
//  LikeButtonControl.swift
//  VK-UIKit
//
//  Created by Владимир on 17.02.2021.
//

import UIKit

//@IBDesignable
class LikeButtonControl: UIControl {
    
    var button = UIButton(type: .custom)
    var label = UILabel()
    
    let imgNoLike = UIImage(named: "heart-7")
    let imgLike = UIImage(named: "heart-6")
    
    var flag = false
    var likeCount = 0 {
        didSet {
            label.text = "\(likeCount)"
            flag = !flag
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    */
    
    
    // MARK: - Init
    //
    private func setup() -> Void {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        let whitespace = CGFloat(5)
        let buttonFrame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        let labelFrame = CGRect(
            x: buttonFrame.width + whitespace, y: 0,
            width: self.frame.width - 2 * (buttonFrame.width + whitespace), height: self.frame.height
        )
        
        button.frame = buttonFrame
        button.setImage(imgNoLike, for: .normal)
        button.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        
        label.frame = labelFrame
        label.text = "\(likeCount)"
        
        self.addSubview(label)
        self.addSubview(button)
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.setup()
    }
    
    
    
    // MARK: - Action
    //
    @objc func like(_ sender: UIButton) {
        
        switch flag {
        case true:
            self.likeCount -= 1
            self.button.setImage(imgNoLike, for: .normal)
            self.label.textColor = UIColor.black
            
        case false:
            self.likeCount += 1
            self.button.setImage(imgLike, for: .normal)
            self.label.textColor = UIColor.red
        }
    }

}
