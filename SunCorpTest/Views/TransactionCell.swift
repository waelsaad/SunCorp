//
//
//  SunCorpTest
//
//  Created by Wael Saad on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import UIKit
import Foundation

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblEffectiveDate: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public func configure(description: String?, effectiveDate: String, amount: String) {
        
        accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        lblDescription.text = description
        lblEffectiveDate.text = effectiveDate
        lblAmount.text = amount
        
        lblAmount.sizeToFit()
        lblDescription.sizeToFit()
        lblEffectiveDate.sizeToFit()
    }
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblAmount.center.y = self.contentView.center.y
        
        lblAmount.sizeToFit()
        lblAmount.translatesAutoresizingMaskIntoConstraints     = false
        
        // Autolayout using VFL and Constraints
        let viewsDict = ["lblAmount" : lblAmount] as [String : UIView]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[lblAmount(49)]", metrics: nil, views: viewsDict))
        
        //self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[lblAmount]", options: NSLayoutFormatOptions.alignAllCenterY,metrics: nil, views: viewsDict))
        
        self.addConstraint(NSLayoutConstraint(item: lblAmount, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20))
    }*/
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
