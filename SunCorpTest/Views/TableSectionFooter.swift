//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import UIKit
import Foundation

class TableSectionFooter: UITableViewHeaderFooterView {

    @IBOutlet weak var lblBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblBalance.sizeToFit()
        lblBalance.translatesAutoresizingMaskIntoConstraints     = false
        
        // Autolayout using VFL and Constraints
        let viewsDict = ["lblBalance" : lblBalance] as [String : UIView]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-13-[lblBalance(80)]", metrics: nil, views: viewsDict))
        self.addConstraint(NSLayoutConstraint(item: lblBalance, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -40))
    }
}
