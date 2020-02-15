//
//  MainTableViewController.swift
//  COVID-19
//
//  Created by 西田翔平 on 2020/02/15.
//  Copyright © 2020 西田翔平. All rights reserved.
//

import UIKit
import Firebase

class MainTableViewController: UITableViewController {
    
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        db.collection("test").whereField("name", isEqualTo: "aaa").getDocuments{(snapshot, error) in
            if error != nil {
                print("error")
            } else {
                for document in (snapshot?.documents)! {
                    print("aaa")
                    if let name = document.data()["country"] as? String {
                        if let cases = document.data()["cases"] as? String {
                            print(name,cases)
                        }
                    }
                }
            }
        }
        
        db.collection("test").getDocuments() {(snapshot, error) in
            if error != nil {
                print("error")
            } else {
                for document in (snapshot?.documents)! {
                    print("bbb")
                    print(document.documentID)
                    print(document.data())
                    if let name = document.data()["country"] as? String {
                        if let cases = document.data()["cases"] as? String {
                            print(name,cases)
                        }
                    }
                }
            }
        }
        
        db.collection("test").order(by: "cases", descending: true).getDocuments() {(snapshot, error) in
            if error != nil {
                print("error")
            } else {
                for document in (snapshot?.documents)! {
                    print("ccc")
                    if let name = document.data()["country"] as? String {
                        if let cases = document.data()["cases"] as? String {
                            print(name,cases)
                        }
                    }
                }
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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