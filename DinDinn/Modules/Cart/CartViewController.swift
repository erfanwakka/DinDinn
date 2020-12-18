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
    //MARK: Overrides
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
//MARK: - CodeView -
extension CartViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.pinEdgesToSuperview()
    }
    func setupAdditionalConfiguration() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CartItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CartItemTableViewCell")
        tableView.register(UINib(nibName: "CartTotalValueTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTotalValueTableViewCell")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTotalValueTableViewCell", for: indexPath) as! CartTotalValueTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! CartItemTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
}
