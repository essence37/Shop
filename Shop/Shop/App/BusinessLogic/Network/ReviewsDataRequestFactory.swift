//
//  ReviewsDataRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 08.01.2021.
//

import Foundation
import Alamofire

/// - Tag: Реализация добавления и удаления отзыва о товаре, получение всех отзывов о товаре.
protocol ReviewsDataRequestFactory {
    func addReview(userID: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    func deleteReview(commentID: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void)
    func getAllProductReviews(page: Int, productID: Int, completionHandler: @escaping (AFDataResponse<GetAllProductReviewsResult>) -> Void)
}
