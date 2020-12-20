//
//  CartItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

protocol CartItemTableViewCellDelegate: class {
    func removeMenuItem(menuItem: MenuItem)
}
class CartItemTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        if let menuItem = menuItem {
            self.delegate?.removeMenuItem(menuItem: menuItem)
        }
    }
    //MARK: Vars
    private var menuItem: MenuItem?
    private weak var delegate: CartItemTableViewCellDelegate?
    
    //MARK: Overrides
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Functions
    func setData(menuItem: MenuItem, delegate: CartItemTableViewCellDelegate?) {
        self.delegate = delegate
        self.menuItem = menuItem
        self.titleLabel.text = menuItem.title
        self.priceLabel.text = "\(menuItem.price) usd"
        self.itemImageView?.image = UIImage(named: menuItem.imageURL)
    }


}
