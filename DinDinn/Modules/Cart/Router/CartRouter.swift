//
//  CartRouter.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import UIKit


class CartRouter: CartPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = CartViewController()
        let presenter: CartViewToPresenterProtocol & CartInteractorToPresenterProtocol = CartPresenter()
        let router: CartPresenterToRouterProtocol = CartRouter()
        let interactor: CartPresentorToInteractorProtocol = CartInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
}
