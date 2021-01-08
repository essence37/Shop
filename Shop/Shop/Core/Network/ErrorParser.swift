//
//  ErrorParser.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation

/// - Tag: Реализация протокола обработки ошибок.
class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
