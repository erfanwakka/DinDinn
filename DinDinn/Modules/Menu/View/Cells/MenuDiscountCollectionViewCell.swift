//
//  MenuDiscountCollectionViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class MenuDiscountCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}
//MARK: - CodeView -
extension MenuDiscountCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(imageView)
    }
    func setupConstraints() {
        imageView.pinEdgesToSuperview()
    }
    func setupAdditionalConfiguration() {
    }
}
