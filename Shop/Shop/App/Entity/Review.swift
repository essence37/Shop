//
//  Review.swift
//  Shop
//
//  Created by Пазин Даниил on 08.01.2021.
//

import Foundation

struct Review: Codable {
    let commentID: Int
    let userID: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case commentID = "id_comment"
        case userID = "id_user"
        case text = "text"
    }
}
