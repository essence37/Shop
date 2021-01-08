//
//  AbstractErrorParser.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation

/// - Tag: Протокол, отвечающий за обработку ошибок.
protocol AbstractErrorParser {
    // Обработка при получении ошибки через Alamofire.
    func parse(_ result: Error) -> Error
    // Обработка при получении данных через Alamofire.
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
