//
//  GetCatalogDataResult.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation

struct GetCatalogDataResult: Codable {
    let result: Int
    let page: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case page = "page_number"
        case products = "products"
    }
}
