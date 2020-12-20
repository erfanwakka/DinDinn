//
//  CartPresenter.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import Foundation
import RxSwift

class CartPresenter {
    
    //MARK: Vars
    var view: CartPresenterToViewProtocol?
    var interactor: CartPresentorToInteractorProtocol?
    var router: CartPresenterToRouterProtocol?
    
    //MARK: Inits
    
    //MARK: Functions

}
extension CartPresenter: CartViewToPresenterProtocol {
    func getItemsCount() -> Int {
        return interactor?.items.count ?? 0
    }
    
    func getItem(index: Int) -> MenuItem? {
        if index >= interactor?.items.count ?? 0 {
            return nil
            
        }
        return interactor?.items[index]
    }
    
    func getTotalValue() -> Double {
        return interactor?.totalValue ?? 0.0
    }
    
    func updateView() {
        interactor?.fetchUserItems()
    }
    func removeMenuItem(menuItem: MenuItem) {
        interactor?.removeMenuItem(menuItem: menuItem)
    }
    func getIndex(_ menuItem: MenuItem) -> Int? {
        return interactor?.items.firstIndex(of: menuItem) ?? 0
    }
}
extension CartPresenter: CartInteractorToPresenterProtocol {
    func userCartFetched() {
        view?.showCartItems()
    }
}
