//
//  Network.swift
//  github-example
//
//  Created by Yusuf Demirkoparan on 11.12.2022.
//

import Foundation

public class NetworkLayer: NSObject, URLSessionDelegate {
    
    var queue = DispatchQueue(label: "test", qos: .background)
     
    func session() -> URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        config.waitsForConnectivity = true
        config.urlCache  = .shared
        
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }
  
    func fetchFromGithubSearch() {
        let url = "https://api.github.com/search/repositories?q=postman&order=desc&per_page=30"
        let type = "GET"
        
        if let url = URL(string: url) {
            let urlRequest = URLRequest(url: url)
            
            session().dataTask(with: urlRequest) { data, response, error in
                
                DispatchQueue.main.async {
                    if let error {
                        print(error)
                    }
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        if let data  {
                            let result = try decoder.decode(GithubSearchResponseModel.self, from: data)
                            print("******** \n \(result) \n ********")
                        }
                       
                    } catch let error {
                        print(error, "######")
                    }
                }
               
                
                //GithubSearchResponseModel
                 
            }.resume()
        }
    }
}
