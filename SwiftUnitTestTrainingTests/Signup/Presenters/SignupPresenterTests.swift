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
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Mashood",
                                              lastName: "Murtaza",
                                              email: "mashood.murtaza@gmail.com",
                                              password: "123456",
                                              repeatPassword: "123456")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
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
}
