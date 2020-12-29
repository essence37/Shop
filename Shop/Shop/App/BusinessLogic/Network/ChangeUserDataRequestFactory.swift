//
//  ChangeUserDataRequestFactory.swift
//  Shop
//
//  Created by Пазин Даниил on 26.12.2020.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeData(userID: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<PersonalDataChangeResult>) -> Void)
}
