//
//  AllGroupsTableViewController.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData: [Group]?
    var flag = false
    var realIndex: Int!
    
    
    // MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        filteredData = AllGroups.data.copy()
        
        searchBar.delegate = self
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroup", for: indexPath) as? AllGroupsTableViewCell else {
            
            return UITableViewCell()
        }

        cell.setData(
//            name: AllGroups.data.getGroup(id: indexPath.row)?.name ?? "",
//            avatarName: AllGroups.data.getGroup(id: indexPath.row)?.avatar ?? "VK_Compact_Logo"
            name: filteredData?[indexPath.row].name ?? "",
            avatarName: filteredData?[indexPath.row].avatar ?? "VK_Compact_Logo"
        )
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AllGroupsTableViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            filteredData = AllGroups.data.copy()
            flag = false
        } else {
            filteredData = AllGroups.data.copy()?.filter {
                (item: Group) -> Bool in
                return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            flag = true
        }
        tableView.reloadData()
    }
}
