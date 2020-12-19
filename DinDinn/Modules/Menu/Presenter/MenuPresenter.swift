//
//  MenuPresenter.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import Foundation
import RxSwift

class MenuPresenter {
    
    //MARK: Vars
    var view: MenuPresenterToViewProtocol?
    var interactor: MenuPresentorToInteractorProtocol?
    var router: MenuPresenterToRouterProtocol?
    
    //MARK: Inits
    
    //MARK: Functions

}
extension MenuPresenter: MenuViewToPresenterProtocol {
    func updateView() {
        
    }
    
    func getItemsCount(forSection section: String) -> Int {
        
    }
    
    func getItem(forSection section: String, index: Int) -> MenuItem? {
        
    }
    
}
extension MenuPresenter: MenuInteractorToPresenterProtocol {
    func wallFetched() {
        
    }
    
    func wallFetchedWithError(error: Error) {
        
    }
    
}
