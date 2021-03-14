//
//  ShowPhotoScreenSegue.swift
//  VK-UIKit
//
//  Created by Владимир on 11.03.2021.
//

import UIKit

class ShowPhotoScreenSegue: UIStoryboardSegue {

    override func perform() {
                
        guard let photoCollectionViewController = source as? FrendPhotoCollectionViewController else {
            return
        }
        guard let photoScreenViewController = destination as? PhotoScreenViewController else {
            return
        }
        
        photoScreenViewController.user = photoCollectionViewController.user
        photoScreenViewController.currentPhotoID = photoCollectionViewController.selectPhotoID ?? 0

        
        
        super.perform()
    }
}
