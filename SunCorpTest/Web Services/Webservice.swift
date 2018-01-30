//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import Foundation
import Alamofire

protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        get {
            return Notification.Name(self.rawValue)
        }
    }
}

enum Notifications: String, NotificationName {
    case ResponseReceived
}

typealias JSONDictionary = [String:Any]

class Webservice {
    
    func getTransactions(url :URL, callback :@escaping ([Transaction]) -> ()) {
        
        var transactions = [Transaction]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [[String:Any]]
                transactions = dictionary.flatMap { dictionary in return Transaction(dictionary : dictionary) }
            }
            
            DispatchQueue.main.async {
                callback(transactions)
            }
            
            }.resume()
    }
    
    //I didn't really need to use AlamoFire but I could have.
    /*
    func getTransactions(url :String){
        
        var transactions = [Transaction]()
        
        let urlAddressEscaped = url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        //Request with caching policy
        let request = URLRequest(url: URL(string: urlAddressEscaped!)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 120)
        
        Alamofire.request(request)
            .responseJSON { (response) in

                let cachedURLResponse = CachedURLResponse(response: response.response!, data: (response.data! as NSData) as Data, userInfo: nil, storagePolicy: .allowed)
                URLCache.shared.storeCachedResponse(cachedURLResponse, for: response.request!)
                
                if let data = response.data {
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    let dictionary = json as! [[String:Any]]
                    transactions = dictionary.flatMap { dictionary in return Transaction(dictionary : dictionary) }
                }
                
                guard response.result.error == nil else {
                    print("error fetching data from url")
                    print(response.result.error!)
                    return
                }
        }
    }*/
}
