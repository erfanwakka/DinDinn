//
//  MenuItem.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import Foundation

struct Wall: Decodable {
    let discountsURLs: [String]
    let sections: MenuSection
}
struct MenuSection: Decodable {
    let name: String
    let items: [MenuItem]
}
struct MenuItem: Decodable {
    let name: String
    let ingridients: String
    let imageURL: String
    let price: String
    let info: String
}
