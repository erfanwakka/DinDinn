//
//  CartTotalValueTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class CartTotalValueTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    //MARK: Vars
    
    //MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Functions
    func setData(totalPrice: Double) {
        self.totalPriceLabel.text = "total: \(totalPrice)"
    }

}
