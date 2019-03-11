//
//  CategoriesViewController.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Categories"
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = categories[indexPath.row]
        return cell!
    }
    
    
}
