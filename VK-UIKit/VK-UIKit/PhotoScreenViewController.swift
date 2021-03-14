//
//  PhotoScreenViewController.swift
//  VK-UIKit
//
//  Created by Владимир on 07.03.2021.
//

import UIKit

class PhotoScreenViewController: UIViewController {

    var user: User!
    var currentPhotoID: Int = 0
    
    var photo: UIImageView!
    var photoViewOriginPoint: CGPoint!
    var centerXAnchor: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.photo = UIImageView()
        self.view.addSubview(photo)
        
        self.photo.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor = self.photo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.centerXAnchor.isActive = true
        self.photo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.photo.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        self.photo.heightAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        
        self.view.backgroundColor = .black
        self.photo.backgroundColor = .white
        self.photo.image = UIImage(named: self.user.getPhotoByIndex(index: self.currentPhotoID) ?? "")
        
        
        self.photoViewOriginPoint = self.photo.frame.origin
        
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(panRecognizer)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    var swipeFlag: Bool = false
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        
        let scaleStart = CGAffineTransform(scaleX: 0.7, y: 0.7)
        let scaleFinish = CGAffineTransform(scaleX: 1, y: 1)
        
        switch recognizer.state {
        case .began, .changed:
            self.photo.center = CGPoint(x: (self.photo.center.x + translation.x), y: self.photo.center.y)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            let partOfCompletedScreenForSwipe = self.view.frame.width / 3
            let swipeLength = self.photoViewOriginPoint.x - self.photo.frame.origin.x
            
            if swipeLength >= partOfCompletedScreenForSwipe {
                
                if self.currentPhotoID >= 0 && (self.currentPhotoID + 1) < (self.user.photos?.count ?? 0), self.swipeFlag != true {
                    
                    self.swipeFlag = true
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        options: [.curveEaseIn],
                        animations: {
                            self.photo.frame.origin.x = self.photoViewOriginPoint.x - self.photo.frame.width
                            self.photo.transform = scaleStart
                            self.photo.layer.opacity = 0
                        },
                        completion: { isCompletedSuccessfully in
                            if isCompletedSuccessfully {
                                self.photo.frame.origin.x = self.photoViewOriginPoint.x + self.photo.frame.width
                                self.photo.transform = scaleFinish

                                self.currentPhotoID += 1
                                self.photo.image = UIImage(named: self.user.getPhotoByIndex(index: self.currentPhotoID) ?? "")
                                
                                UIView.animate(
                                    withDuration: 0.3,
                                    delay: 0,
                                    options: [.curveEaseIn],
                                    animations: {
                                        self.photo.frame.origin.x = self.photoViewOriginPoint.x
                                        self.photo.layer.opacity = 1
                                    },
                                    completion: { _ in
                                        self.swipeFlag = false
                                    }
                                )
                            }
                        }
                    )
                }
            } else if swipeLength <= -partOfCompletedScreenForSwipe {
                if self.currentPhotoID > 0 && self.currentPhotoID < (self.user.photos?.count ?? 0), self.swipeFlag != true {
                    
                    self.swipeFlag = true
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        options: [.curveEaseIn],
                        animations: {
                            self.photo.frame.origin.x = self.photoViewOriginPoint.x + self.photo.frame.width
                            self.photo.transform = scaleStart
                            self.photo.layer.opacity = 0
                        },
                        completion: { isCompletedSuccessfully in
                            if isCompletedSuccessfully {
                                self.photo.frame.origin.x = self.photoViewOriginPoint.x - self.photo.frame.width
                                self.photo.transform = scaleFinish

                                self.currentPhotoID -= 1
                                self.photo.image = UIImage(named: self.user.getPhotoByIndex(index: self.currentPhotoID) ?? "")
                                
                                UIView.animate(
                                    withDuration: 0.3,
                                    delay: 0,
                                    options: [.curveEaseIn],
                                    animations: {
                                        self.photo.frame.origin.x = self.photoViewOriginPoint.x
                                        self.photo.layer.opacity = 1
                                    },
                                    completion: { _ in
                                        self.swipeFlag = false
                                    }
                                )
                            }
                        }
                    )
                }
            }
            
        case .ended, .cancelled:
            if !swipeFlag {
                UIView.animate(withDuration: 0.2, animations: {
                    self.photo.frame.origin.x = self.photoViewOriginPoint.x
                })
            }
            
        default:
            break
        }
    }

    
    func setUser(user: User?) -> Void {
        self.user = user
    }
    
}

