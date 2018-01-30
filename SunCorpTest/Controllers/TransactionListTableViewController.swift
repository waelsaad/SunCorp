//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import Foundation
import UIKit

class TransactionListTableViewController : UITableViewController  {
    
    public var viewModel :TransactionListViewModel = TransactionListViewModel()  {
        
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var didSelect: (TransactionViewModel) -> () = { _ in }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTransactions()
        
        self.title = self.viewModel.title
        
        //Let us know when the response has been recieved then we display and render the header and footer
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayHeaderAndFooter), name: Notifications.ResponseReceived.name, object: nil)
    }
    
    @objc private func displayHeaderAndFooter () {
        
        //These 4 lines can replace all commented lines below, just an alternative way of assigning the header and footer views.
        let headerView = (Bundle.main.loadNibNamed("TableSectionHeader", owner: self, options: nil)![0] as? TableSectionHeader)
        let footerView = (Bundle.main.loadNibNamed("TableSectionFooter", owner: self, options: nil)![0] as? TableSectionFooter)
        
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView

        headerView?.lblHeading1.text = "Welcome"
        headerView?.lblHeading2.text = "Wael"
        
        footerView?.lblBalance.text = self.viewModel.totalBalance.description
        
        //Just an alternative way of displaying the header and footer
        /*
         let headerNib = UINib.init(nibName: "TableSectionHeader", bundle: Bundle.main)
         tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
         
         let footerNib = UINib.init(nibName: "TableSectionFooter", bundle: Bundle.main)
         tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "TableSectionFooter")
         */
    }
    
    private func loadTransactions() {
        
        let url = URL(string: Constants.base_url)!
        
        // this web service should use generic types. Again this is not part of the implementation
        // as we are focusing on MVVM model
        Webservice().getTransactions(url: url) { transactions in
            print(transactions)
            
            let transactions = transactions.map { transaction in
                return TransactionViewModel(transaction :transaction)
            }
            
            self.viewModel = TransactionListViewModel(transactions :transactions)
            
            //Wait until the response is received and data is rendered then display header and footer
            NotificationCenter.default.post(name: Notifications.ResponseReceived.name, object: self)
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transactionViewModel = self.viewModel.transactions[indexPath.row]
        didSelect(transactionViewModel)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionDetailTableViewController") as! TransactionDetailTableViewController
        
        vc.transaction = transactionViewModel
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TransactionCell
        
        let transactionViewModel = self.viewModel.transactions[indexPath.row]

        cell.configure(description: transactionViewModel.description, effectiveDate: transactionViewModel.effectiveDate.toString(format: "EEEE d MMM yyyy")!, amount: transactionViewModel.amount.description)
        
        cell.backgroundColor = (indexPath.row % 2 == 0) ? UIColor.lightGray : UIColor.white
        
        return cell
    }
    

    //These lines are also replaced by the function displayHeaderAndFooter
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeader") as! TableSectionHeader
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionFooter") as! TableSectionFooter
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100.0
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
