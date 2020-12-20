//
//  MenuDiscountsTableViewCell.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

protocol MenuDiscountsTableViewCellDelegate: class {
    func didChangeSection(withIndex index: Int)
}
class MenuDiscountsTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuSectionsCollectionView: UICollectionView!
    @IBOutlet weak var menuSectionsContainerView: UIView!
    
    //MARK: Vars
    private var selectedIndex = 0
    private var discountUrls: [String] = []
    private var items: [String] = []
    private var delegate: MenuDiscountsTableViewCellDelegate?
    
    //MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuDiscountCollectionViewCell.self, forCellWithReuseIdentifier: MenuDiscountCollectionViewCell.name)
        collectionView.isPagingEnabled = true
        
        
        menuSectionsCollectionView.dataSource = self
        menuSectionsCollectionView.delegate = self
        menuSectionsCollectionView.register(MenuItemSectionCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemSectionCollectionViewCell.name)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        menuSectionsContainerView.setCornerRadius(forCorners: [.topLeft, .topRight], withRadius: 48)
    }
    
    //MARK: - Functions -
    func setData(items: [String], urls: [String], delegate: MenuDiscountsTableViewCellDelegate?, selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        self.delegate = delegate
        self.items = items
        self.discountUrls = urls
        pageControl.numberOfPages = discountUrls.count
        collectionView.reloadData()
    }
    func refreshSections(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        menuSectionsCollectionView.reloadData()
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
            return discountUrls.count
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuSectionsCollectionView {
            selectedIndex = indexPath.item
            delegate?.didChangeSection(withIndex: indexPath.item)
            menuSectionsCollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuSectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemSectionCollectionViewCell.name, for: indexPath) as! MenuItemSectionCollectionViewCell
            cell.setupView()
            cell.setData(title: items[indexPath.item], isSelected: selectedIndex == indexPath.item)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuDiscountCollectionViewCell.name, for: indexPath) as! MenuDiscountCollectionViewCell
            cell.setupView()
            cell.imageView.image = UIImage(named: discountUrls[indexPath.item])
            return cell
        }
    }
    
}
