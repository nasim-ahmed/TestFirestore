//
//  ViewController.swift
//  TestFirestore
//
//  Created by Nasim on 2/6/18.
//  Copyright © 2018 Nasim. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var users = [User]()

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        AlertService.addUser(in: self) { user in
            FIRFirestoreService.sharedInstance.create(for: user, in: FIRCollectionReference.users)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
  
        FIRFirestoreService.sharedInstance.read(from: FIRCollectionReference.users, returning: User.self) { (users) in
            self.users = users
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.age)
      
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        AlertService.update(user, in: self) { (updatedUser) in
            FIRFirestoreService.sharedInstance.update(for: updatedUser, in: .users)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        
        let user = users[indexPath.row]
        FIRFirestoreService.sharedInstance.delete(user.self, in: .users)
    }

}

