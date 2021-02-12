//
//  GetAllProductReviewsResult.swift
//  Shop
//
//  Created by Пазин Даниил on 08.01.2021.
//

import Foundation

struct GetAllProductReviewsResult: Codable {
    let page: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case page = "page_number"
        case reviews = "reviews"
    }
}
