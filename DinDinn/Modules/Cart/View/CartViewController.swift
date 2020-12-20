//
//  CartViewController.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK: Vars
    let tableView = UITableView()
    var items: [MenuItem] = []
    var presenter: CartViewToPresenterProtocol?
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Cart"
        presenter?.updateView()
        setupView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: Functions
    
}
extension CartViewController: CartPresenterToViewProtocol  {
    func userCartUpdated() {
        //TODO: - remove specific cell and update value only -
        tableView.reloadData()
    }
    
    func showCartItems() {
        tableView.reloadData()
    }
}
//MARK: - CodeView -
extension CartViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.pinSafeTop()
        tableView.pinEdgesHorizontallyToSuperview()
        tableView.pinBottom()
    }
    func setupAdditionalConfiguration() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: CartItemTableViewCell.name, bundle: nil), forCellReuseIdentifier: CartItemTableViewCell.name)
        tableView.register(UINib(nibName: CartTotalValueTableViewCell.name, bundle: nil), forCellReuseIdentifier: CartTotalValueTableViewCell.name)
    }
}
//MARK: - tableView delegate -
extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK: - tableView dataSource -
extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter?.getItemsCount() ?? 0
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CartItemTableViewCell.name, for: indexPath) as! CartItemTableViewCell
            if let item = presenter?.getItem(index: indexPath.row) {
                cell.setData(menuItem: item, delegate: self)
            }
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTotalValueTableViewCell.name, for: indexPath) as! CartTotalValueTableViewCell
            cell.selectionStyle = .none
            cell.setData(totalPrice: presenter?.getTotalValue() ?? 0.0)
            return cell
        }
    }
}
extension CartViewController: CartItemTableViewCellDelegate {
    func removeMenuItem(menuItem: MenuItem) {
        if let index = presenter?.getIndex(menuItem) {
            presenter?.removeMenuItem(menuItem: menuItem)
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            tableView.reloadSections(.init(arrayLiteral: 1), with: .automatic)
        }
    }
}
