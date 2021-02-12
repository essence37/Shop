//
//  BasketDataRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 15.01.2021.
//

import Foundation
import Alamofire

protocol BasketDataRequestFactory {
    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
    func deleteFromBasket(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
    func payBasket(basketID: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
