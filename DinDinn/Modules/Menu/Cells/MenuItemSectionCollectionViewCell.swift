//
//  MenuItemSectionCollectionViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class MenuItemSectionCollectionViewCell: UICollectionViewCell {
    
    let button = UIButton()
    
}
//MARK: - CodeView -
extension MenuItemSectionCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(button)
    }
    func setupConstraints() {
        button.pinEdgesToSuperview()
    }
    func setupAdditionalConfiguration() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.setTitleColor(.black, for: .normal)
    }
}
