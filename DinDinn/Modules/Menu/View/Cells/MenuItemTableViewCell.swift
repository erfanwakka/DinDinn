//
//  MenuItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

protocol MenuItemTableViewCellDeelgate: class {
    func didBuyItem(_ menuItem: MenuItem)
}
class MenuItemTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var ingridientsLabel: UILabel!
    
    //MARK: IBActions
    
    @IBAction func didTapPriceButton(_ sender: UIButton) {
        setPriceButton(selected: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setPriceButton(selected: false)
        }
        if let menuItem = menuItem {
            delegate?.didBuyItem(menuItem)
        }
    }
    //MARK: Vars
    private var delegate: MenuItemTableViewCellDeelgate?
    private var menuItem: MenuItem?
    private  var shadowFrame: CGRect {
        let width = Int(UIScreen.main.bounds.width - 80)
        let height = 120
        
        return CGRect(x: 2,
                      y: 8,
                      width: width,
                      height: height)
    }
    
    //MARK: Overrides
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        priceButton.setTitle("added", for: .selected)
    }
    
    //MARK: Functions
    
    func setPriceButton(selected: Bool) {
        priceButton.isSelected = selected
        priceButton.backgroundColor = priceButton.isSelected ? .green : .black
        priceButton.tintColor = priceButton.isSelected ? .green : .black
    }
    func setData(menuItem: MenuItem, delegate: MenuItemTableViewCellDeelgate) {
        self.delegate = delegate
        self.menuItem = menuItem
        self.titleLabel.text = menuItem.title
        self.infoLabel.text = menuItem.info
        self.priceButton.setTitle("\(menuItem.price) usd", for: .normal)
        self.ingridientsLabel.text = menuItem.ingridients
        self.itemImageView?.image = UIImage(named: menuItem.imageURL)
        containerView.removeShadowLayer()
        containerView.addShadowFrame(shadowColor: .lightGray, shadowOffset: .zero, shadowOpacity: 1, shadowRadius: 24, shadowFrame: shadowFrame)
    }
    
}
