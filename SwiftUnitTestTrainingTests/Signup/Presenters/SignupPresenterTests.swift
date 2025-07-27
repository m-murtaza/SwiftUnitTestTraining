//
//  SignupPresenterTests.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

class SignupPresenterTests: XCTestCase {
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Mashood",
                                              lastName: "Murtaza",
                                              email: "mashood.murtaza@gmail.com",
                                              password: "123456",
                                              repeatPassword: "123456")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInfoProvided_WillValidateEachProperty() {
        //Act
        sut.proceedSignup(data: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFristNameValid)
        XCTAssertTrue(mockSignupModelValidator.isEmailVaild)
        XCTAssertTrue(mockSignupModelValidator.isPasswordVaild)
        XCTAssertTrue(mockSignupModelValidator.isPasswordMatched)
    }
    
    func testSignupPresenter_WhenGivenValidForm_ShouldCallSignupMethod() {
        //Act
        sut.proceedSignup(data: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallSuccessOnViewDelegate() {
        let expextation = self.expectation(description: "signup expectation")
        
        mockSignupViewDelegate.expactation = expextation
        //Act
        sut.proceedSignup(data: signupFormModel)
        self.wait(for: [expextation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulCounter, 1)
    }
}
