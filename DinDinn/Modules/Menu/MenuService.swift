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
let endpointClosure = { (target: MenuService) -> Endpoint in
    return Endpoint(url: URL(target: target).absoluteString, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
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
