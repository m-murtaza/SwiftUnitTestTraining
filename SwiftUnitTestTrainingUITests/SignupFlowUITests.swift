//
//  SignupFlowUITests.swift
//  SwiftUnitTestTrainingUITests
//
//  Created by Mashud Murtaza on 28/07/2025.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupFlow_WhenLoaded_requiredUIElementsAreEnabled() throws {
        let app = XCUIApplication()
        app.launch()
        
        ///Access text fields with placeholder
//        let firstName = app.textFields["First Name"]
//        let email = app.textFields["Email"]
//        let password = app.secureTextFields["Password"]
        ///Access text fields with accessibilityIdentifier: helpful in case of multiple language support
        let firstName = app.textFields["firstname"]
        let email = app.textFields["email"]
        let password = app.secureTextFields["password"]
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
    }

    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
