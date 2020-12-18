//
//  CartItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
