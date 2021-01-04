//
//  CatalogData.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation
import Alamofire

class CatalogData: AbstractRequestFactory {
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

extension CatalogData: CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int, categotyID: Int, completionHandler: @escaping (AFDataResponse<GetCatalogDataResult>) -> Void) {
        let requestModel = GetCatalogData(baseUrl: baseUrl, pageNumber: pageNumber, categotyID: categotyID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CatalogData {
    struct GetCatalogData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "catalogData"
        
        let pageNumber: Int
        let categotyID: Int
        var parameters: Parameters? {
            return [
                "page_number" : pageNumber,
                "id_category" : categotyID
            ]
        }
    }
}
