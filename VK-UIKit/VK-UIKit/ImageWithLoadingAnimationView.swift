//
//  ImageWithLoadingAnimationView.swift
//  VK-UIKit
//
//  Created by Владимир on 06.03.2021.
//

import UIKit

class ImageWithLoadingAnimationView: UIView {

    var isLoaded = false
    
    var standartImageView: UIImageView!
    var loadingAnimationView: LoadingAnimationView!
    
    
    private func setup() -> Void {
        
        loadingAnimationView = LoadingAnimationView()
        self.addSubview(loadingAnimationView)
        loadingAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        self.loadingAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.loadingAnimationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.loadingAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.loadingAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        standartImageView = UIImageView()
        self.addSubview(standartImageView)
        standartImageView.translatesAutoresizingMaskIntoConstraints = false
        standartImageView.alpha = 0
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        if isLoaded {
            self.standartImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.standartImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.standartImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            self.standartImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

            UIView.animate(withDuration: 0.5, animations: {
                self.standartImageView.alpha = 1
            })
        } else {

            UIView.animate(
                withDuration: 0.1,
                delay: 2.0,
                options: [],
                animations: {
                    self.loadingAnimationView.alpha = 0
                },
                completion: { _ in
                    self.standartImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    self.standartImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    self.standartImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    self.standartImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

                    UIView.animate(withDuration: 0.5, animations: {
                        self.standartImageView.alpha = 1
                    })
                    
                    self.isLoaded = true
                }
            )
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    
    func setImage(name: String?) -> Void {
        
        guard let named = name else {
            self.standartImageView.image = UIImage(named: "")
            return
        }
        self.standartImageView.image = UIImage(named: named)
    }
    
}
