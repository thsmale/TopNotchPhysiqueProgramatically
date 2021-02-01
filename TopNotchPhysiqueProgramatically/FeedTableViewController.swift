//
//  FeedTableViewController.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 9/13/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    let cellId = "FeedTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.title = "Feed"
        

        
        //Where the hell did this tableView object come from
        //Why did auto complete not work for register function
        //Where in the documentation can one find this
        self.tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.rowHeight = 350
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FeedTableViewCell else {
            fatalError("Type of cell not recognized for FeedTableView")
        }

        // Configure the cell...
        //cell.contentCell.backgroundColor = .green
        //cell.contentTitle.backgroundColor = .red

        cell.contentCreator.text = "username123"
        cell.contentTitle.text = "Video title. Row \(indexPath)"

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
