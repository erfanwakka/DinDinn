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
}

protocol MenuViewToPresenterProtocol: class {
    var view: MenuPresenterToViewProtocol? { get set }
    var interactor: MenuPresentorToInteractorProtocol? { get set }
    var router: MenuPresenterToRouterProtocol? { get set }
    
    func updateView()
//    func getDiscount
    func getItemsCount(forSection section: String) -> Int
    func getItem(forSection section: String, index: Int) -> MenuItem?
}

protocol MenuPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
