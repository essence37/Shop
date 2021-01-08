//
//  AppDelegate.swift
//  Shop
//
//  Created by Пазин Даниил on 19.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.register(userID: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let register):
                print(register.userMessage)
            case .failure(let error):
                print(error)
            }
        }
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login.user)
            case .failure(let error):
                print(error)
            }
        }
        auth.logout(userID: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error)
            }
        }
        let catalogData = requestFactory.makeCatalogDataRequestFactory()
        catalogData.getCatalogData(pageNumber: 1, categotyID: 1) { response in
            switch response.result {
            case .success(let catalogData):
                print(catalogData)
            case .failure(let error):
                print(error)
            }
        }
        let changeData = requestFactory.makeChangeUserDataRequestFactory()
        changeData.changeData(userID: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let changeData):
                print(changeData)
            case .failure(let error):
                print(error)
            }
        }
        let productData = requestFactory.makeProductDataRequestFactory()
        productData.getProductData(productID: 123) { response in
            switch response.result {
            case .success(let productData):
                print(productData)
            case .failure(let error):
                print(error)
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

