//
//  MenuItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit
import RxSwift
import RxCocoa

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
    private var menuItem = PublishSubject<MenuItem>()
    private var disposeBag = DisposeBag()
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
        menuItem.subscribe(onNext: { [weak self] (item) in
            guard let self = self else { return }
            self.titleLabel.text = item.title
            self.infoLabel.text = item.info
            self.priceButton.setTitle("\(item.price) usd", for: .normal)
            self.ingridientsLabel.text = item.ingridients
            //TODO: - image -
            self.priceButton.rx.tap.subscribe(onNext: {
                UserCart.shared.addToUserCart(menuItem: item)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: self.disposeBag)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    //MARK: Functions
    
    func setData(menuItem: MenuItem) {
        self.menuItem.onNext(menuItem)
        containerView.removeShadowLayer()
        containerView.addShadowFrame(shadowColor: .lightGray, shadowOffset: .zero, shadowOpacity: 1, shadowRadius: 24, shadowFrame: shadowFrame)
    }
    
}
