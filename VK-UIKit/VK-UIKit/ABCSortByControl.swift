//
//  ABCSortByControl.swift
//  VK-UIKit
//
//  Created by Владимир on 18.02.2021.
//

import UIKit

class ABCSortByControl: UIControl {

    private var stackView: UIStackView!
    private var labelButtons = [UIButton]()
    

    
    // MARK: - Init
    //
    private func setup(frame: CGRect) -> Void {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        
        self.frame = CGRect(
            x: frame.width - 21,
            y: 0,
            width: 21,
            height: frame.height - 110
        )
        
        for index in 0 ..< Frends.data.count {
            
            let frend = Frends.data.getUser(id: index)
            
            guard let char = frend?.lastName.first else {
                continue
            }

            let newButton = UIButton()
            newButton.setTitle(String(char), for: .normal)
            newButton.setTitleColor(.systemBlue, for: .normal)
            
            if self.labelButtons.isEmpty {
                self.labelButtons.append(newButton)
                continue
            }

            if !isEqualsLabels(labelButtons, str: newButton.title(for: .normal)!) {
                self.labelButtons.append(newButton)
                continue
            }
        }

        stackView = UIStackView(arrangedSubviews: labelButtons)
        stackView.spacing = 1
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
                    
        self.addSubview(stackView)
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.setup(frame: self.bounds)
    }
                
                
                
    override func layoutSubviews() {
        super.layoutSubviews()
                    
        stackView.frame = self.bounds
    }
                
         
                
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

                
                
    // MARK: -
    //
                
                
    func isEqualsLabels(_ labels: [UIButton], str: String) -> Bool {
        
        var flag = false
        
        for label in labels {
            if label.title(for: .normal) == str {
                flag = true
                break
            }
        }
        return flag
    }
}

