//
//  AbstractErrorParser.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
