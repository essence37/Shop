//
//  SignUpResult.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
}
