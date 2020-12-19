//
//  CartItemTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit
import RxSwift

protocol CartItemTableViewCellDelegate: class {
    func removeMenuItem(menuItem: MenuItem)
}
class CartItemTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    //MARK: Vars
    private var menuItem = PublishSubject<MenuItem>()
    private var disposeBag = DisposeBag()
    private weak var delegate: CartItemTableViewCellDelegate?
    
    //MARK: Overrides
    override  func awakeFromNib() {
        super.awakeFromNib()
        menuItem.subscribe(onNext: { [weak self] (item) in
            guard let self = self else { return }
            self.titleLabel.text = item.title
            self.priceLabel.text = "\(item.price) usd"
            //TODO: - image -
            self.closeButton.rx.tap.subscribe(onNext: {
                self.delegate?.removeMenuItem(menuItem: item)
            }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: self.disposeBag)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    //MARK: Functions
    func setData(menuItem: MenuItem, delegate: CartItemTableViewCellDelegate?) {
        self.delegate = delegate
        self.menuItem.onNext(menuItem)
    }


}
