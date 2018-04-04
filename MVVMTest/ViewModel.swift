//
//  ViewModel.swift
//  MVVMTest
//
//  Created by Sukumar Anup Sukumaran on 02/04/18.
//  Copyright © 2018 AssaRadviewTech. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
   
    var apiClient = APIClient()
    
    var apps: [NSDictionary]?
    
    func getApps(completion: @escaping () -> Void) {
        
        apiClient.fetchAppList { (arrayOfAppsDic) in
            
            DispatchQueue.main.async {
                self.apps = arrayOfAppsDic
                
                completion()
            }
            
        }
        
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return apps?.count ?? 0
    }
    
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "name") as? String ?? ""
    }
    
    func appRatingToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "artistName") as? String ?? ""
    }

}
