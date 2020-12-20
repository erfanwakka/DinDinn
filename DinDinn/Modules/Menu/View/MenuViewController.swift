//
//  MenuViewController.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    
    //MARK: Vars
    var presenter: MenuViewToPresenterProtocol?
    private let shopButton = UIButton()
    private let tableView = UITableView()
    private let disposeBag = DisposeBag()
    private var selectedIndex = 0
    private let numberOfSections = 2
    
    //MARK: Overrides
    
    //MARK: Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.updateView()
    }
}
//MARK: - CodeView -
extension MenuViewController: CodeView {
    func buildViewHierarchy() {
        
        view.addSubview(tableView)
        view.addSubview(shopButton)
    }
    func setupConstraints() {
        
        tableView.pinEdgesToSuperview()
        
        shopButton.pinRight(20)
        shopButton.pinSafeBottom(20)
        shopButton.width(with: 50)
        shopButton.squareViewConstraint()
        shopButton.cornerRadius = 25
    }
    @objc func didSwipe(swipe: UISwipeGestureRecognizer) {
        var index = selectedIndex
        if swipe.direction == .right {
            index -= 1
            if index < 0 { index = 0 }
        } else if swipe.direction == .left {
            index += 1
            if index >= presenter?.getSections().count ?? 0 {
                index = (presenter?.getSections().count ?? 1) - 1
            }
        } else {
            return
        }
        selectedIndex = index
        tableView.reloadSections(.init(arrayLiteral: 1), with: .automatic)
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MenuDiscountsTableViewCell {
            cell.refreshSections(selectedIndex: selectedIndex)
        }
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        shopButton.setImage(#imageLiteral(resourceName: "cart"), for: .normal)
        shopButton.borderColor = .gray
        shopButton.borderWidth = 1
        shopButton.rx.tap.subscribe(onNext: {
            let vc = CartRouter.createModule()
            UIApplication.showOnTopViewController(vc)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(swipe:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(swipe:)))
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        tableView.addGestureRecognizer(swipeLeft)
        tableView.addGestureRecognizer(swipeRight)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.rx.setDataSource(self).disposed(by: disposeBag)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: MenuItemTableViewCell.name, bundle: nil), forCellReuseIdentifier: MenuItemTableViewCell.name)
        tableView.register(UINib(nibName: MenuDiscountsTableViewCell.name, bundle: nil), forCellReuseIdentifier: MenuDiscountsTableViewCell.name)
    }
}
//MARK: - tableView delegate -
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return UIScreen.main.bounds.height * 2 / 3 }
        return UITableView.automaticDimension
    }
}
//MARK: - tableView dataSource -
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return presenter?.getItemsCount(forSectionIndex: selectedIndex) ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuDiscountsTableViewCell.name, for: indexPath) as! MenuDiscountsTableViewCell
            cell.selectionStyle = .none
            cell.setData(items: presenter?.getSections() ?? [], urls: presenter?.getDiscountUrls() ?? [], delegate: self, selectedIndex: selectedIndex)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableViewCell.name, for: indexPath) as! MenuItemTableViewCell
        if let item = presenter?.getItem(forSectionIndex: selectedIndex, index: indexPath.row) {
            cell.setData(menuItem: item, delegate: self)
        }
        cell.selectionStyle = .none
        return cell
    }
}
extension MenuViewController: MenuPresenterToViewProtocol {
    func showWall() {
        tableView.reloadData()
    }
    func showError() {
        //TODO: - show error -
    }
    
}
extension MenuViewController: MenuDiscountsTableViewCellDelegate {
    func didChangeSection(withIndex index: Int) {
        selectedIndex = index
        tableView.reloadSections(.init(arrayLiteral: 1), with: .automatic)
    }
}
extension MenuViewController: MenuItemTableViewCellDeelgate {
    func didBuyItem(_ menuItem: MenuItem) {
        presenter?.addToCart(menuItem: menuItem)
    }
}
