//
//  RequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation
import Alamofire

/// - Tag: Класс отвечает за создание экземпляров классов, которые непосредственно занимаются обработкой запросов.
class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductDataRequestFactory() -> ProductDataRequestFactory {
        let errorParser = makeErrorParser()
        return ProductData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCatalogDataRequestFactory() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewsDataRequestFactory() -> ReviewsDataRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewsData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeBasketDataRequestFactory() -> BasketDataRequestFactory {
        let errorParser = makeErrorParser()
        return BasketData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
