//
//  GetProductDataResult.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation

struct GetProductDataResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
