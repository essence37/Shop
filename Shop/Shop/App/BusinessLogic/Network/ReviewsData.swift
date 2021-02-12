//
//  ReviewsData.swift
//  Shop
//
//  Created by Пазин Даниил on 08.01.2021.
//

import Foundation
import Alamofire

/// - Tag: Класс реализует протокол AuthRequestFactory и занимается непосредственно обработкой запросов добавления, удаления отзыва и получения всех отзывов о товаре.
class ReviewsData: AbstractRequestFactory {
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

extension ReviewsData: ReviewsDataRequestFactory {
    func addReview(userID: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userID: userID, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func deleteReview(commentID: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let requsetModel = DeleteReview(baseUrl: baseUrl, commentID: commentID)
        self.request(request: requsetModel, completionHandler: completionHandler)
    }
    func getAllProductReviews(page: Int, productID: Int, completionHandler: @escaping (AFDataResponse<GetAllProductReviewsResult>) -> Void) {
        let requestModel = AllProductReviews(baseUrl: baseUrl, page: page, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewsData {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        
        let userID: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": userID,
                "text": text
            ]
        }
    }
    struct DeleteReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deleteReview"
        
        let commentID: Int
        var parameters: Parameters? {
            return ["id_comment": commentID]
        }
    }
    struct AllProductReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getAllProductReviews"
        
        let page: Int
        let productID: Int
        var parameters: Parameters? {
            return [
                "page_number": page,
                "id_product": productID
            ]
        }
    }
}
