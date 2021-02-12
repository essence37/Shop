//
//  SignUpModel.swift
//  Shop
//
//  Created by Пазин Даниил on 22.01.2021.
//

import UIKit

struct SignUpModel {
    var userID: Int?
    var username: String
    var password: String
    var email: String?
    var gender: String?
    var creditCard: String?
    var bio: String?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init(userID: Int?, username: String, password: String, email: String?, gender: String?, creditCard: String?, bio: String?) {
        self.userID = userID
        self.username = username
        self.password = password
        self.email = email
        self.gender = gender
        self.creditCard = creditCard
        self.bio = bio
    }
}
