//
//  MenuItem.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import Foundation


struct Wall: Decodable {
    let discountsURLs: [String]
    let sections: [MenuSection]
}
struct MenuSection: Decodable {
    let name: String
    let items: [MenuItem]
}
struct MenuItem: Decodable {
    let id: String
    let title: String
    let ingridients: String
    let imageURL: String
    let price: Double
    let info: String
}
extension MenuItem: Equatable {
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id
    }
}
