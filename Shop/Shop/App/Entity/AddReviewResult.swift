//
//  AddReviewResult.swift
//  Shop
//
//  Created by Пазин Даниил on 08.01.2021.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
}
