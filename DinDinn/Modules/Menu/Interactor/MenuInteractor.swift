//
//  MenuInteractor.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import Foundation
import Moya
import RxSwift

class MenuInteractor {
    
    //MARK: Vars
    var disposeBag = DisposeBag()
    var presenter: MenuInteractorToPresenterProtocol?
    var wall: Wall?
    private let provider = MoyaProvider<MenuService>(stubClosure: MoyaProvider.immediatelyStub)
    
    //MARK: Inits
    
    //MARK: Functions
    
}
extension MenuInteractor: MenuPresentorToInteractorProtocol {
    
    func fetchWall() {
        provider.rx.request(.wall).subscribe { [weak self] (event) in
            guard let self = self else { return }
            switch event {
            case .success(let response):
                do {
                    let wall = try response.map(Wall.self)
                    self.wall = wall
                    self.presenter?.wallFetched()
                } catch let error {
                    self.presenter?.wallFetchedWithError(error: error)
                }
            case .error(let error):
                self.presenter?.wallFetchedWithError(error: error)
            }
        }.disposed(by: disposeBag)
    }
    
    
    
}
