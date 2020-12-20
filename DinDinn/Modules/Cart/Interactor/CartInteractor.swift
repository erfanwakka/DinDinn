//
//  CartInteractor.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import Foundation

class CartInteractor {
    
    //MARK: Vars
    var presenter: CartInteractorToPresenterProtocol?
    var items: [MenuItem] {
        UserCart.shared.items
    }
    var totalValue: Double {
        return items.map({$0.price}).reduce(0, {
            $0 + $1
        })
    }
    //MARK: Inits
    
    //MARK: Functions
    
}
extension CartInteractor: CartPresentorToInteractorProtocol {
    
    func fetchUserItems() {
        presenter?.userCartFetched()
    }
    func removeMenuItem(menuItem: MenuItem) {
        UserCart.shared.removeFromUserCard(menuItem: menuItem)
    }
    
    
}
