//
//  ProductData.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation
import Alamofire

class ProductData: AbstractRequestFactory {
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

extension ProductData: ProductDataRequestFactory {
    func getProductData(productID: Int, completionHandler: @escaping (AFDataResponse<GetProductDataResult>) -> Void) {
        let requestModel = GetProductData(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductData {
    struct GetProductData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodById"
        
        let productID: Int
        var parameters: Parameters? {
            return ["id_product" : productID]
        }
    }
}
