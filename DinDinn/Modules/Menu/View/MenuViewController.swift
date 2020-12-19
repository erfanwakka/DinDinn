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
    private var menuItems = PublishSubject<[MenuItem]>()
    private var discountsUrls = PublishSubject<[String]>()
    private let disposeBag = DisposeBag()
    //MARK: Overrides
    
    //MARK: Functions
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        wall.subscribe { [weak self] (event) in
            guard let self = self else { return }
            switch event {
            case .next(let wall):
                self.discountsUrls.onNext(wall.discountsURLs)
                if let section = wall.sections.first {
                    self.menuItems.onNext(section.items)
                }
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                break
            }
        }.disposed(by: disposeBag)
        menuItems.bind(to: tableView.rx.items(cellIdentifier: "MenuItemTableViewCell", cellType: MenuItemTableViewCell.self)) { row, item, cell in
            cell.setData(menuItem: item)
        }.disposed(by: disposeBag)
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
        
        shopButton.pinSafeRight()
        shopButton.pinSafeBottom()
        shopButton.width(with: 50)
        shopButton.squareViewConstraint()
    }
    @objc func didSwipe() {
        tableView.reloadSections(.init(arrayLiteral: 1), with: .automatic)
    }
    func setupAdditionalConfiguration() {
        shopButton.setImage(#imageLiteral(resourceName: "card"), for: .normal)
        shopButton.rx.tap.subscribe(onNext: {
            let vc = CartRouter.createModule()
            UIApplication.showOnTopViewController(vc)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        swipe.direction = [.left, .right]
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.rx.setDataSource(self).disposed(by: disposeBag)
        tableView.addGestureRecognizer(swipe)
        tableView.contentInsetAdjustmentBehavior = .never
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let c = tableView.dequeueReusableCell(withIdentifier: "MenuDiscountsTableViewCell", for: indexPath) as! MenuDiscountsTableViewCell
            c.selectionStyle = .none
            return c
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! MenuItemTableViewCell
//        if let item = selectedSection?.items[indexPath.row] {
//            cell.setData(menuItem: item)
//        }
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
