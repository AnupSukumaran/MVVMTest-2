//
//  APIClient.swift
//  MVVMTest
//
//  Created by Sukumar Anup Sukumaran on 02/04/18.
//  Copyright © 2018 AssaRadviewTech. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    
    func fetchAppList(completion: @escaping ([NSDictionary]?) -> Void) {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json") else {
            print("Error Loading API ULR")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else {
                print("Error getting data")
                return
            }
            
            do{
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary {
                    
                    if let apps = responseJSON.value(forKeyPath: "feed.results") as? [NSDictionary] {
                        
                        completion(apps)
                    }
                    
                }
            }catch{
                
                completion(nil)
                print("Erorr getting API data: \(error.localizedDescription)")
                
            }
            
        }
        
        dataTask.resume()
        
    }

}
