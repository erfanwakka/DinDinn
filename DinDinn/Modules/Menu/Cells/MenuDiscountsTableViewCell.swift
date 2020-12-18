//
//  MenuDiscountsTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit
import RxSwift
import RxCocoa

class MenuDiscountsTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuSectionsCollectionView: UICollectionView!
    @IBOutlet weak var menuSectionsContainerView: UIView!
    
    //MARK: Vars
    private var discountImages: [UIImage] = [#imageLiteral(resourceName: "burger1"),#imageLiteral(resourceName: "sushi1"),#imageLiteral(resourceName: "pizza1")]
    private var items: [String] = ["Pizza", "Sushi", "Drinks"]
    
    //MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuDiscountCollectionViewCell.self, forCellWithReuseIdentifier: "MenuDiscountCollectionViewCell")
        collectionView.isPagingEnabled = true
        
        
        menuSectionsCollectionView.dataSource = self
        menuSectionsCollectionView.delegate = self
        menuSectionsCollectionView.register(MenuItemSectionCollectionViewCell.self, forCellWithReuseIdentifier: "MenuItemSectionCollectionViewCell")
        
        pageControl.numberOfPages = discountImages.count
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        menuSectionsContainerView.setCornerRadius(forCorners: [.topLeft, .topRight], withRadius: 48)
    }
}
//MARK: - collectionView delegate -
extension MenuDiscountsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuSectionsCollectionView {
            return CGSize(width: Int(collectionView.bounds.width) / items.count, height: 30)
        } else {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3 * 2)
        }
    }
}
//MARK: - collectionView datasource -
extension MenuDiscountsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuSectionsCollectionView {
            return items.count
        } else {
            return discountImages.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = collectionView.contentOffset.x / collectionView.bounds.width
        pageControl.currentPage = Int(currentIndex)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuSectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemSectionCollectionViewCell", for: indexPath) as! MenuItemSectionCollectionViewCell
            cell.setupView()
            cell.button.setTitle(items[indexPath.item], for: .normal)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuDiscountCollectionViewCell", for: indexPath) as! MenuDiscountCollectionViewCell
            cell.imageView.image = discountImages[indexPath.item]
            cell.setupView()
            return cell
        }
    }
    
}
