//
//  TableViewController.swift
//  MVVM-2
//
//  Created by Vlad Katsubo on 23.11.22.
//

import UIKit

class TableViewController: UITableViewController {

    
    var profiles: [Profile]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profiles = [Profile(name: "John", secondName: "Smith", age: 22),
                    Profile(name: "Mark", secondName: "Cellman", age: 25),
                    Profile(name: "Max", secondName: "Verstappen", age: 26)
        ]
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell else { return UITableViewCell()}
        let profile = profiles[indexPath.row]
        
        tableViewCell.fullNameLabel.text = "\(profile.name) \(profile.secondName)"
        tableViewCell.ageLabel.text = String(describing: profile.age)
        
        return tableViewCell
    }

}
