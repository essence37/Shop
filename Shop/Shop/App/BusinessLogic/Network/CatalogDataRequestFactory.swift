//
//  CatalogDataRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int, categotyID: Int, completionHandler: @escaping (AFDataResponse<GetCatalogDataResult>) -> Void)
}
