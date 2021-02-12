//
//  ResponseCodableTests.swift
//  ShopTests
//
//  Created by Пазин Даниил on 28.12.2020.
//

import XCTest
import Alamofire
@testable import Shop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSignUpRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "id_user" : 123,
                "username" : "Somebody",
                "password" : "mypassword",
                "email" : "some@some.ru",
                "gender": "m",
                "credit_card" : "9872389-2424-234224-234",
                "bio" : "This is good! I think I will switch to another language"
            ]
        }

        AF
            .request("https://mighty-sea-74278.herokuapp.com/register", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<SignUpResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLoginRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "username": "Somebody",
                "password": "mypassword"
            ]
        }

        AF
            .request("https://mighty-sea-74278.herokuapp.com/login", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<LoginResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLogoutRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return ["id_user": 123]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/logout", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<LogoutResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testChangeUserDataRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "id_user" : 123,
                "username": "Somebody",
                "password": "mypassword",
                "email": "some@some.ru",
                "gender": "m",
                "credit_card": "9872389-2424-234224-234",
                "bio": "This is good! I think I will switch to another language"
            ]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/changeUserData", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PersonalDataChangeResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCatalogDataRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "page_number" : 1,
                "id_category" : 1
            ]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/catalogData", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<GetCatalogDataResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testProductDataRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return ["id_product": 123]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/getGoodById", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<GetProductDataResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddReviewRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "id_user": 123,
                "text": "Хороший товар"
            ]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/addReview", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<AddReviewResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeleteReviewRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return ["id_comment": 123]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/deleteReview", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<DeleteReviewResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testAllProductReviewsDataRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "page_number": 1,
                "id_product": 123
            ]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/getAllProductReviews", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<GetAllProductReviewsResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    // MARK: - Тесты, связанные с корзиной.
    func testAddToBasketRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return [
                "id_product": 123,
                "quantity": 1
            ]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/addToBasket", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<AddToBasketResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeleteFromBasketRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return ["id_product": 123]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/deleteFromBasket", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<DeleteFromBasketResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPayBasketRequestShouldDownloadAndParse() {
        var parameters: Parameters? {
            return ["id_basket": 123]
        }
        AF
            .request("https://mighty-sea-74278.herokuapp.com/payBasket", method: .post, parameters: parameters)
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PayBasketResult, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
