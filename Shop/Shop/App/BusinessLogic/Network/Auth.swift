//
//  Auth.swift
//  Shop
//
//  Created by Пазин Даниил on 24.12.2020.
//

import Foundation
import Alamofire

/// - Tag: Класс реализует протокол AuthRequestFactory и занимается непосредственно обработкой запроса "Войти" и "Выйти".
class Auth: AbstractRequestFactory {
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

extension Auth: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func logout(userID: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requsetModel = Logout(baseUrl: baseUrl, userID: userID)
        self.request(request: requsetModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        
        let userID: Int
        var parameters: Parameters? {
            return ["id_user": userID]
        }
    }
}
