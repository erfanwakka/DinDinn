//
//  UserCart.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import Foundation

class UserCart {
    
    //MARK: Vars
    static let shared = UserCart()
    var items: [MenuItem] = []
    
    //MARK: Inits
    private init() {}
    
    //MARK: Functions

    func addToUserCart(menuItem: MenuItem) {
        items.append(menuItem)
    }
    func removeFromUserCard(menuItem: MenuItem) {
        items.removeAll { (item) -> Bool in
            item == menuItem
        }
    }
}
