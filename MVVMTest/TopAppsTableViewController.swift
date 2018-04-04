//
//  TopAppsTableViewController.swift
//  MVVMTest
//
//  Created by Sukumar Anup Sukumaran on 02/04/18.
//  Copyright © 2018 AssaRadviewTech. All rights reserved.
//

import UIKit

class TopAppsTableViewController: UITableViewController {
    
    var viewModel = ViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.getApps {
            
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfItemsToDisplay(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.appTitleToDisplay(for: indexPath)
        
        cell.detailTextLabel?.text = viewModel.appRatingToDisplay(for: indexPath)
        
        return cell
        
    }
  
}
