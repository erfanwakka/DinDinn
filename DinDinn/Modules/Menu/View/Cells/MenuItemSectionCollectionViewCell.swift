//
//  MenuItemSectionCollectionViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class MenuItemSectionCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    func setData(title: String, isSelected: Bool = false) {
        label.text = title
        label.textColor = isSelected ? .black : .gray
    }
}
//MARK: - CodeView -
extension MenuItemSectionCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(label)
    }
    func setupConstraints() {
        label.pinEdgesToSuperview()
    }
    func setupAdditionalConfiguration() {
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
}
