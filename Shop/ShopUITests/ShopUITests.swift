//
//  ShopUITests.swift
//  ShopUITests
//
//  Created by Пазин Даниил on 19.12.2020.
//

import XCTest

class ShopUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccess() throws {
        
    }
    
    func testFailure() throws {
        
        enterAuthData(login: "", password: "")
        
        let resultLabel = app.textViews["Please complete all fields."]
        XCTAssertNotNil(resultLabel)
    }

    private func enterAuthData(login: String, password: String) {
        
        let loginTextField = app.textFields["Username"]
        loginTextField.tap()
        loginTextField.typeText(login)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)
        
        let button = app.buttons["Sign In"]
        button.tap()
    }

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
