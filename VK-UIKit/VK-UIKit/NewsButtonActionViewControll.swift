//
//  NewsButtonActionViewControll.swift
//  VK-UIKit
//
//  Created by Владимир on 26.02.2021.
//

import UIKit

class NewsButtonActionViewControll: UIControl {

    var buttonLike = UIButton(type: .custom)
    var buttonComment = UIButton(type: .custom)
    var buttonLook = UIButton(type: .custom)
    
    var labelLike = UILabel()
    var labelComment = UILabel()
    var labelLook = UILabel()
    
    let imgNoLike = UIImage(named: "heart-7")
    let imgLike = UIImage(named: "heart-6")
    let imgComment = UIImage(named: "comment")
    let imgLook = UIImage(named: "look")
    
    
    var flag = false
    var likeCount = 0 {
        didSet {
            labelLike.text = "\(likeCount)"
        }
    }
    
    var commentCount = 0 {
        didSet {
            labelComment.text = "\(commentCount)"
        }
    }
    
    var lookCount = 0 {
        didSet {
            labelLook.text = "\(lookCount)"
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
        
        self.backgroundColor = UIColor.white
        
        let whitespace = CGFloat(5)
        let yOffset = CGFloat(5)
        let width: CGFloat = self.frame.height/2
        
        var frame = CGRect.zero
        var totalWidth: CGFloat = whitespace
        
        frame = CGRect(x: totalWidth, y: yOffset, width: width, height: width)
        totalWidth += frame.width + whitespace
        buttonLike.frame = frame
        buttonLike.setImage(imgNoLike, for: .normal)
        buttonLike.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        
        frame = CGRect(x: totalWidth, y: yOffset, width: 4 * whitespace, height: width)
        totalWidth += frame.width + whitespace
        labelLike.frame = frame
        labelLike.text = "\(likeCount)"
        
        frame = CGRect(x: totalWidth, y: yOffset, width: width, height: width)
        totalWidth += frame.width + whitespace
        buttonComment.frame = frame
        buttonComment.setImage(imgComment, for: .normal)
//        buttonComment.addTarget(self, action: #selector(comment(_:)), for: .touchUpInside)
        
        frame = CGRect(x: totalWidth, y: yOffset, width: 4 * whitespace, height: width)
        totalWidth += frame.width + whitespace
        labelComment.frame = frame
        labelComment.text = "\(commentCount)"
        
        frame = CGRect(x: totalWidth, y: yOffset, width: width, height: width)
        totalWidth += frame.width + whitespace
        buttonLook.frame = frame
        buttonLook.setImage(imgLook, for: .normal)
//        buttonLook.addTarget(self, action: #selector(look(_:)), for: .touchUpInside)
        
        frame = CGRect(x: totalWidth, y: yOffset, width: 7 * whitespace, height: width)
        totalWidth += frame.width + whitespace
        labelLook.frame = frame
        labelLook.text = "\(lookCount)"
        
        self.addSubview(buttonLike)
        self.addSubview(labelLike)
        self.addSubview(buttonComment)
        self.addSubview(labelComment)
        self.addSubview(buttonLook)
        self.addSubview(labelLook)
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
            self.buttonLike.setImage(imgNoLike, for: .normal)
            self.labelLike.textColor = UIColor.black
            flag = false
            
        case false:
            self.likeCount += 1
            self.buttonLike.setImage(imgLike, for: .normal)
            self.labelLike.textColor = UIColor.red
            flag = true
        }
    }

}
