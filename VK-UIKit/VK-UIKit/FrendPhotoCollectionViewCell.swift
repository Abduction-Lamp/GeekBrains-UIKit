//
//  FrendPhotoCollectionViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendPhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var photoImageView: ImageWithLoadingAnimationView!
    
    var frend: User!
    var currentPhotoID: Int!
    
    // MARK: - Methods
    //
    func setupUser(user: User?, indexPhoto: Int) -> Void {
        guard let frend = user else {
            return
        }
        
        self.frend = frend
        self.currentPhotoID = indexPhoto
        
        if let photo = frend.photos?[indexPhoto] {
            self.photoImageView.setImage(name: photo)
        }
    }
    
    
    
}
