//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import Foundation


struct TransactionListViewModel {
    var totalBalance: Double = 0
    var title :String? = "Transactions"
    var transactions :[TransactionViewModel] = [TransactionViewModel]()
}

extension TransactionListViewModel {
    
    init(transactions :[TransactionViewModel]) {
        
        //order by most recent effective date
        self.transactions    = transactions.sorted   { $0.effectiveDate > $1.effectiveDate }
        self.totalBalance = getTotalBalance()
    }
    
    public func getTotalBalance() -> Double
    {
        var sum: Double = 0
        
        for x in transactions
        {
            sum += x.amount
        }
        return sum
    }
}

struct TransactionViewModel {
    
    var id :Int
    var description :String
    var amount: Double
    var effectiveDate: Date
}

extension TransactionViewModel {

    init(transaction :Transaction) {
        self.id = transaction.id
        self.description = transaction.description
        self.amount = transaction.amount
        self.effectiveDate = transaction.effectiveDate
    }
}
