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
        
        // MARK: - FIXME
        //                  Тут нужно как-то добраться до номера ячейки с которой сделан переход
        
        
        super.perform()
    }
}
