//
//  FrendsTableViewController.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendsTableViewController: UITableViewController {
    
    var abcNavigationControl: ABCSortByControl!
    
    
    //  MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Frends.data.sortByUp()
        
        abcNavigationControl = ABCSortByControl(frame: self.view.bounds)
        self.view.addSubview(abcNavigationControl)
        self.view.bringSubviewToFront(abcNavigationControl)
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Frends.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FrendCell", for: indexPath) as? FrendTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupUser(user: Frends.data.getUser(id: indexPath.row) ?? nil)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*_staticDataSource    id    0x0    0x0000000000000000
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
    //  MARK: - Data transfer
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SegueFromFrendsTableToFrendPhoto" else {
            return
        }
        
        //  Источник данных (экземпляр класса FrendsTableViewController)
        guard let source = segue.source as? FrendsTableViewController else {
            return
        }
        
        //  Получатель данных (экземпляр класса FrendPhotoCollectionViewController)
        guard let destination = segue.destination as? FrendPhotoCollectionViewController else {
            return
        }
        
        if let index = source.tableView.indexPathForSelectedRow {
            destination.setData(
                userID: index.row,
                countPhotos: Frends.data.getCountPhotosForUser(id: index.row)
            )
        }
    }

    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
