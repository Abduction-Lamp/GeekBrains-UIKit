//
//  FrendsTableViewController.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class FrendsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var filteredData: [User]?
    var searchBarInFocus = false
    
//    var abcNavigationControl: ABCSortByControl!
    
    
    
    //  MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        Frends.data.sortByUp()
        filteredData = Frends.data.copy()
        
        //
        searchBar.delegate = self
        
        
//        abcNavigationControl = ABCSortByControl(frame: self.view.bounds)
//        self.view.addSubview(abcNavigationControl)
//        self.view.bringSubviewToFront(abcNavigationControl)
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        var number = 1
        if !searchBarInFocus {
            number = Frends.data.countSectionsInfo
        }
        return number
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = filteredData?.count ?? 0
        if !searchBarInFocus {
            number = Frends.data.getNumberOfRowsInSection(index: section) ?? 0
        }
        return number
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var name: String? = nil
        if !searchBarInFocus {
            name = String(Frends.data.getLetterNameOfSection(index: section) ?? "0")
        }
        return name
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var indexTitles: [String]? = nil
        
        if !searchBarInFocus {
            indexTitles = Frends.data.getSectionIndexTitles()
        }
        return indexTitles
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FrendCell", for: indexPath) as? FrendTableViewCell else {
            return UITableViewCell()
        }
        guard let startIndex = Frends.data.getDataStartIndexInSection(index: indexPath.section) else {
            return UITableViewCell()
        }
        
        if !searchBarInFocus {
            let frendId = startIndex + indexPath.row
            cell.setupUser(user: Frends.data.getUser(id: frendId) ?? nil)
        } else {
            cell.setupUser(user: filteredData?[indexPath.row])
        }
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
            if !searchBarInFocus {
                guard let startIndex = Frends.data.getDataStartIndexInSection(index: index.section) else {
                    return
                }
                let id = startIndex + index.row
                destination.setupData(user: Frends.data.getUser(id: id))
            } else {
                destination.setupData(user: filteredData![index.row])
            }
        }
    }

    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
}




extension FrendsTableViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            filteredData = Frends.data.copy()
            searchBarInFocus = false
        } else {
            filteredData = Frends.data.copy()?.filter {
                (item: User) -> Bool in
                return item.fullName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            searchBarInFocus = true
        }
        tableView.reloadData()
    }
}
