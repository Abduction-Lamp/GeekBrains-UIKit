//
//  FrendPhotoCollectionViewCell.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
//        // MARK: - Actions
//        //
//        @IBAction func goToPhoto(segue: UIStoryboardSegue) {
//    
//            if segue.identifier == "GoToPhoto" {
//    
//                guard let frendsTableViewCollection = segue.source as? FrendsTableViewController else {
//                    return
//                }
//    
//                if let index = frendsTableViewCollection.tableView.indexPathForSelectedRow {
//                    if let photo = FrendsTableViewController.frends?[index.row].avatar {
//                        photoImageView.image = UIImage(named: photo)
//                        self.reloadInputViews()
//                    }
//                }
//            }
//        }
}
