//
//  SignUp.swift
//  Shop
//
//  Created by Пазин Даниил on 26.12.2020.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
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

extension SignUp: SignUpRequestFactory {
    func register(userID: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, userID: userID, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct Register: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "register"
        
        let userID: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user" : userID,
                "username" : login,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
