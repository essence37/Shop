//
//  Product.swift
//  Shop
//
//  Created by Пазин Даниил on 03.01.2021.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
