//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import Foundation
import UIKit

class TransactionDetailTableViewController : UIViewController  {
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblEffectiveDate: UILabel!
    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblAmountHeading: UILabel!
    
    var headerView:TableSectionHeader!
    var transaction:TransactionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAmount.text = transaction.amount.description
        lblDescription.text = transaction.description.description
        lblEffectiveDate.text = transaction.effectiveDate.toString(format: "EEEE d MMM yyyy")!
        
        setupConstraints ()
        
        displayHeaderAndFooter ()
    }
    
    private func setupConstraints() {

        lblAmount.translatesAutoresizingMaskIntoConstraints = false
        lblAmountHeading.translatesAutoresizingMaskIntoConstraints = false
        
        // Autolayout using VFL and Constraints
        let viewsDict = ["lblAmount" : lblAmount, "lblAmountHeading": lblAmountHeading] as [String : UIView]
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-250-[lblAmountHeading]-(-1)-[lblAmount(50)]", metrics: nil, views: viewsDict))
        
        self.view.addConstraint(NSLayoutConstraint(item: lblAmountHeading, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -20))
        
        self.view.addConstraint(NSLayoutConstraint(item: lblAmount, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -20))
    }
    
    // I wanted to re-use the already existing view as the header for the controller instead of creating a new one
    private func displayHeaderAndFooter () {
        
        headerView = (Bundle.main.loadNibNamed("TableSectionHeader", owner: self, options: nil)![0] as? TableSectionHeader)!
        headerView.lblHeading1.text = "Transaction"
        headerView.lblHeading2.text = "Details"
        headerView.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height, width: (self.view.frame.width), height: (headerView.frame.height))
        self.view.addSubview(headerView)
    }
    
    
    // Therefore I needed to handle the UI rotation manually unlike in the UITableView
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if(screenWidth > screenHeight){
            headerView.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height + 33, width: (self.view.frame.width), height: (headerView.frame.height))
        }
        else{
            headerView.frame = CGRect(x: 0, y: self.navigationController!.navigationBar.frame.height - 11, width: (self.view.frame.height), height: (headerView.frame.height))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

