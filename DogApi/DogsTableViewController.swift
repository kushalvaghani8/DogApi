//
//  DogsTableViewController.swift
//  DogApi
//
//  Created by Kushal Vaghani on 13/06/2022.
//

import UIKit

class DogsTableViewController: UITableViewController {
  
    var dogsData: [String:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONparse()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func JSONparse() {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")
        do {
            let dogs = try Data(contentsOf: url!)
            let json = try JSONSerialization.jsonObject(with: dogs,options:[])
            
            if let jsonDic = json as? [String: AnyObject]
            {
                if let obj = jsonDic["message"] as? [String: [String]]
                {
                    dogsData = obj
                }
            }
           // print(dogsData)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dogsData.keys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dogcell", for: indexPath)

        // Configure the cell...
        let breed = Array(dogsData.keys)[indexPath.row]
        cell.textLabel?.text =  breed
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.text = dogsData[breed]?.joined(separator: ", ")
        
        cell.detailTextLabel?.numberOfLines = 0
      
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

