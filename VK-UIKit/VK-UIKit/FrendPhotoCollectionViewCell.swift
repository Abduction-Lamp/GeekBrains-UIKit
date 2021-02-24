//
//  FrendPhotoCollectionViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendPhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // MARK: - Methods
    //
    func setupUser(user: User?, indexPhoto: Int) -> Void {
        guard let frend = user else {
            return
        }
        
        if let photo = frend.photos?[indexPhoto] {
            self.photoImageView.image = UIImage(named: photo)
        }
    }
}
