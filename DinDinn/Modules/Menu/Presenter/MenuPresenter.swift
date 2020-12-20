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
        interactor?.fetchWall()
    }
    
    func getItemsCount(forSectionIndex sectionIndex: Int) -> Int {
        return interactor?.wall?.sections[sectionIndex].items.count ?? 0
    }
    
    func getItem(forSectionIndex sectionIndex: Int, index: Int) -> MenuItem? {
        return interactor?.wall?.sections[sectionIndex].items[index]
    }
    func getDiscountUrls() -> [String] {
        return interactor?.wall?.discountsURLs ?? []
    }
    func getSections() -> [String] {
        var sections = [String]()
        for section in interactor?.wall?.sections ?? [] {
            sections.append(section.name)
        }
        return sections
    }
    func addToCart(menuItem: MenuItem) {
        interactor?.addToCart(menuItem: menuItem)
    }
    
}
extension MenuPresenter: MenuInteractorToPresenterProtocol {
    func wallFetched() {
        view?.showWall()
    }
    
    func wallFetchedWithError(error: Error) {
        view?.showError()
    }
    
}
