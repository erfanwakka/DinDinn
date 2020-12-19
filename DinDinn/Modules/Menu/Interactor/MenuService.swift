//
//  MenuService.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import Foundation
import Moya

enum MenuService {
    case wall
}
extension MenuService: TargetType {
    var baseURL: URL {
        return URL(string: "/")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        guard let url = Bundle.main.url(forResource: "wall", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
