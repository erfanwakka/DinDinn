//
//  CartProtocols.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import UIKit

protocol CartPresenterToViewProtocol: class {
    
    var presenter: CartViewToPresenterProtocol? { get set }
    func showCartItems()
    func userCartUpdated()
}

protocol CartInteractorToPresenterProtocol: class {
    func userCartFetched()
}

protocol CartPresentorToInteractorProtocol: class {
    var presenter: CartInteractorToPresenterProtocol? { get set }
    var items: [MenuItem] { get }
    var totalValue: Double { get }
    func fetchUserItems()
    func removeMenuItem(menuItem: MenuItem)
}

protocol CartViewToPresenterProtocol: class {
    var view: CartPresenterToViewProtocol? { get set }
    var interactor: CartPresentorToInteractorProtocol? { get set }
    var router: CartPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getItemsCount() -> Int
    func getItem(index: Int) -> MenuItem?
    func getTotalValue() -> Double
    func removeMenuItem(menuItem: MenuItem)
}

protocol CartPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
