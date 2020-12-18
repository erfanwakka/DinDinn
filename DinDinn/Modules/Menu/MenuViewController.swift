//
//  MenuViewController.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit
import Moya

class MenuViewController: UIViewController {

    //MARK: Vars
    let tableView = UITableView()
    //MARK: Overrides
    
    //MARK: Functions
    var z = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
//MARK: - CodeView -
extension MenuViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.pinEdgesToSuperview()
    }
    @objc func didSwipe() {
        z = [4, 3, 10].randomElement() ?? 2
        tableView.reloadSections(.init(arrayLiteral: 1), with: .automatic)
    }
    func setupAdditionalConfiguration() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        swipe.direction = [.left, .right]
        tableView.addGestureRecognizer(swipe)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MenuItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuItemTableViewCell")
        tableView.register(UINib(nibName: "MenuDiscountsTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuDiscountsTableViewCell")
    }
}
//MARK: - tableView delegate -
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 400 }
        return UITableView.automaticDimension
    }
}
//MARK: - tableView dataSource -
extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return z
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let c = tableView.dequeueReusableCell(withIdentifier: "MenuDiscountsTableViewCell", for: indexPath) as! MenuDiscountsTableViewCell
            c.selectionStyle = .none
            return c
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! MenuItemTableViewCell
        cell.setData(menuItem: nil)
        cell.selectionStyle = .none
        return cell
    }
}

