//
//  MenuProtocols.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import UIKit

protocol MenuPresenterToViewProtocol: class {
    
    var presenter: MenuViewToPresenterProtocol? { get set }
    func showWall()
    func showError()
}

protocol MenuInteractorToPresenterProtocol: class {
    func wallFetched()
    func wallFetchedWithError(error: Error)
}

protocol MenuPresentorToInteractorProtocol: class {
    var presenter: MenuInteractorToPresenterProtocol? { get set }
    var wall: Wall? { get }
    
    func fetchWall()
    func addToCart(menuItem: MenuItem)
}

protocol MenuViewToPresenterProtocol: class {
    var view: MenuPresenterToViewProtocol? { get set }
    var interactor: MenuPresentorToInteractorProtocol? { get set }
    var router: MenuPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getDiscountUrls() -> [String]
    func getSections() -> [String]
    func getItemsCount(forSectionIndex sectionIndex: Int) -> Int
    func getItem(forSectionIndex sectionIndex: Int, index: Int) -> MenuItem?
    func addToCart(menuItem: MenuItem)
}

protocol MenuPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
