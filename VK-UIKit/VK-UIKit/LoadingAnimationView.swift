//
//  LoadingAnimationView.swift
//  VK-UIKit
//
//  Created by Владимир on 03.03.2021.
//

import UIKit

class LoadingAnimationView: UIView {

    
    private let radius: CGFloat = 5
    
    
    private var balloonIndicatorViewOne: UIView! {
        didSet {
            balloonIndicatorViewOne.clipsToBounds = true
            balloonIndicatorViewOne.backgroundColor = .gray
        }
    }
    private var balloonIndicatorViewTwo: UIView! {
        didSet {
            balloonIndicatorViewTwo.clipsToBounds = true
            balloonIndicatorViewTwo.backgroundColor = .gray
        }
    }
    private var balloonIndicatorViewTree: UIView! {
        didSet {
            balloonIndicatorViewTree.clipsToBounds = true
            balloonIndicatorViewTree.backgroundColor = .gray
        }
    }
    
    
    
    private func layoutBalloonIndicatorView() {
        
        balloonIndicatorViewTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        balloonIndicatorViewTwo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        balloonIndicatorViewTwo.widthAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
        balloonIndicatorViewTwo.heightAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
        
        balloonIndicatorViewOne.rightAnchor.constraint(equalTo: balloonIndicatorViewTwo.leftAnchor, constant: -radius).isActive = true
        balloonIndicatorViewOne.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        balloonIndicatorViewOne.widthAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
        balloonIndicatorViewOne.heightAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
        
        balloonIndicatorViewTree.leftAnchor.constraint(equalTo: balloonIndicatorViewTwo.rightAnchor, constant: radius).isActive = true
        balloonIndicatorViewTree.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        balloonIndicatorViewTree.widthAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
        balloonIndicatorViewTree.heightAnchor.constraint(equalToConstant: 2 * self.radius).isActive = true
    }
    
    private func setup() {

        balloonIndicatorViewOne = UIView()
        balloonIndicatorViewOne.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(balloonIndicatorViewOne)
        
        balloonIndicatorViewTwo = UIView()
        balloonIndicatorViewTwo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(balloonIndicatorViewTwo)
        
        balloonIndicatorViewTree = UIView()
        balloonIndicatorViewTree.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(balloonIndicatorViewTree)

        layoutBalloonIndicatorView()
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        balloonIndicatorViewOne.layer.cornerRadius = radius
        balloonIndicatorViewTwo.layer.cornerRadius = radius
        balloonIndicatorViewTree.layer.cornerRadius = radius
        
        UIView.animate(withDuration: 0.6, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.balloonIndicatorViewOne.alpha = 0
        })
        UIView.animate(withDuration: 0.6, delay: 0.3, options: [.repeat, .autoreverse], animations: {
            self.balloonIndicatorViewTwo.alpha = 0
        })
        UIView.animate(withDuration: 0.6, delay: 0.6, options: [.repeat, .autoreverse], animations: {
            self.balloonIndicatorViewTree.alpha = 0
        })
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)

        setup()
    }
    
    
    func stopAnimation() {
        balloonIndicatorViewOne.alpha = 0
        balloonIndicatorViewTwo.alpha = 0
        balloonIndicatorViewTree.alpha = 0
    }
    
}
