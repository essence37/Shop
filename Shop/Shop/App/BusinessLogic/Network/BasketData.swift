//
//  BasketData.swift
//  Shop
//
//  Created by Пазин Даниил on 15.01.2021.
//

import Foundation
import Alamofire

class BasketData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://mighty-sea-74278.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension BasketData: BasketDataRequestFactory {
    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, productID: productID, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(productID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func payBasket(basketID: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasket(baseUrl: baseUrl, basketID: basketID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension BasketData {
    struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addToBasket"
        
        let productID: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": productID,
                "quantity": quantity
            ]
        }
    }
    
    struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deleteFromBasket"
        
        let productID: Int
        var parameters: Parameters? {
            return ["id_product": productID]
        }
    }
    
    struct PayBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payBasket"
        
        let basketID: Int
        var parameters: Parameters? {
            return ["id_basket": basketID]
        }
    }
}
