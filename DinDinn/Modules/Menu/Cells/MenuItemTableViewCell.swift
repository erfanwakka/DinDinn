//
//  MenuItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var ingridientsLabel: UILabel!
    
    //MARK: IBActions
    
    //MARK: Vars
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
    
    //MARK: Functions
    
    func setData(menuItem: MenuItem?) {
        self.menuItem = menuItem
        containerView.removeShadowLayer()
        containerView.addShadowFrame(shadowColor: .lightGray, shadowOffset: .zero, shadowOpacity: 1, shadowRadius: 24, shadowFrame: shadowFrame)
    }
    
}
