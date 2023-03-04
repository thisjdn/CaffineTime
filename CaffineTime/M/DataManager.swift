//
//  DataManager.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-02-25.
//

import Foundation

struct URLData {
    private let coreUrl = "https://api.geoapify.com/v2/places?categories=catering.cafe.coffee"
    private let apiKey = "330e488f5d1c421697918a9db7281ce0"
    
    var lat : String {
        return "-0.07071648508463113"
    }
    var lon : String {
        return "51.50848194136378"
    }
    
    var urlString : String {
        let urlString = "\(coreUrl)&limit=20&apiKey=\(apiKey)&filter=circle:\(lat),\(lon),1000&bias=proximity:\(lat),\(lon)"
        return urlString
    }
}

class DataManager {
      
    var urlData = URLData()
     
    
    func fetchRequest() {
        print("fetch request triggered")
        
        let testUrl = urlData.urlString
        print("testUrl: \(testUrl)")
        
        
    }
    
    func parseJSON(urlString: String) {
        
    }
}
