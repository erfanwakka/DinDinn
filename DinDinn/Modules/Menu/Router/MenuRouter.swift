//
//  MenuRouter.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import UIKit

class MenuRouter: MenuPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = MenuViewController()
        let presenter: MenuViewToPresenterProtocol & MenuInteractorToPresenterProtocol = MenuPresenter()
        let router: MenuPresenterToRouterProtocol = MenuRouter()
        let interactor: MenuPresentorToInteractorProtocol = MenuInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
}
