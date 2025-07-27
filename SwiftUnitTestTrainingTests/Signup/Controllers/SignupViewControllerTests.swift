//
//  SignupViewControllerTests.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

final class SignupViewControllerTests: XCTestCase {
    
    var storyBoard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        storyBoard = nil
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasTestFieldsEmpty() throws {
        let firstName = try XCTUnwrap(sut.firstNameField, "first name field is not connected")
        let lastName = try XCTUnwrap(sut.lastNameField, "last name field is not connected")
        let email = try XCTUnwrap(sut.emailField, "email field is not connected")
        let password = try XCTUnwrap(sut.passwordField, "password field is not connected")
        let repeatPassword = try XCTUnwrap(sut.repeatPasswordField, "repeat password name field is not connected")
        
        XCTAssertEqual(firstName.text, "")
        XCTAssertEqual(lastName.text, "")
        XCTAssertEqual(email.text, "")
        XCTAssertEqual(password.text, "")
        XCTAssertEqual(repeatPassword.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton = try XCTUnwrap(sut.signupButton, "signup button does not have any outlet")
        let actions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "signup button does not have any action")
        
        XCTAssertEqual(actions.count, 1, "actions are more than 1")
        XCTAssertEqual(actions.first, "signupAction", "there is no action with name signupAction")
    }
}
