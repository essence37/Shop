//
//  ProductDataRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 28.12.2020.
//

import Foundation
import Alamofire

protocol ProductDataRequestFactory {
    func getProductData(productID: Int, completionHandler: @escaping (AFDataResponse<GetProductDataResult>) -> Void)
}
