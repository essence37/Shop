//
//  SignUpRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 26.12.2020.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func register(userID: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void)
}
