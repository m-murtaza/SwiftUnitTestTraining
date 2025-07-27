//
//  SignupFlowUITests.swift
//  SwiftUnitTestTrainingUITests
//
//  Created by Mashud Murtaza on 28/07/2025.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        firstName = app.textFields["firstname"]
        lastName = app.textFields["lastname"]
        email = app.textFields["email"]
        password = app.secureTextFields["password"]
        repeatPassword = app.secureTextFields["repeatPassword"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        try super.tearDownWithError()
    }

    func testSignupFlow_WhenLoaded_requiredUIElementsAreEnabled() throws {
        ///Access text fields with placeholder
//        let firstName = app.textFields["First Name"]
//        let email = app.textFields["Email"]
//        let password = app.secureTextFields["Password"]
        ///Access text fields with accessibilityIdentifier: helpful in case of multiple language support
//        let firstName = app.textFields["firstname"]
//        let email = app.textFields["email"]
//        let password = app.secureTextFields["password"]
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
    }
    
    func testSignupFlow_WhenInvalidFormSubmitted_PresentErrorDialog() throws {
        firstName.tap()
        firstName.typeText("M")
        
        lastName.tap()
        lastName.typeText("A")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        let submit = app.buttons["submit"]
        submit.tap()
        
        XCTAssertTrue(app.alerts["errorDialog"].waitForExistence(timeout: 1), "error alert dialog not shown")
    }
    
    func testSignupFlow_WhenValidFormSubmitted_PresentSuccessDialog() throws {
        firstName.tap()
        firstName.typeText("Mashood")
        
        lastName.tap()
        lastName.typeText("Murtaza")
        
        email.tap()
        email.typeText("mashood.murtaza@gmail.com")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456")
        
        let submit = app.buttons["submit"]
        submit.tap()
        
        XCTAssertTrue(app.alerts["successDialog"].waitForExistence(timeout: 1), "success alert dialog not shown")
    }

    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
