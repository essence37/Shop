//
//  AuthRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 23.12.2020.
//

import Foundation
import Alamofire

/// - Tag: Реализация входа и выхода из личного кабинета.
protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(userID: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
