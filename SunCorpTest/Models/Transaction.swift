//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import Foundation


class Transaction {
    
    var id: Int
    var description: String
    var amount: Double
    var effectiveDate: Date
    
    init(id :Int, description: String, amount: Double, effectiveDate: Date) {
        self.id = id
        self.description = description
        self.amount = amount
        self.effectiveDate = effectiveDate
    }
    

    init?(dictionary :JSONDictionary) {
        
        let format = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard
            let id = dictionary["id"] as? Int,
            let description = dictionary["description"] as? String,
            let amount = dictionary["amount"] as? Double,
            
            let dateString = dictionary["effectiveDate"] as? String,
            let effectiveDate = dateString.toDate(format: format)
        else {
                return nil
        }

        self.id = id
        self.description = description
        self.amount = amount
        self.effectiveDate = effectiveDate
    }
}
