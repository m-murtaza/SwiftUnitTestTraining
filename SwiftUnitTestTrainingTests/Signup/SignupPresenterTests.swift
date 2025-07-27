//
//  SignupPresenterTests.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

class SignupPresenterTests: XCTestCase {
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testSignupPresenter_WhenInfoProvided_WillValidateEachProperty() {
        //Arrage
        let signupFormModel = SignupFormModel(firstName: "Mashood",
                                              lastName: "Murtaza",
                                              email: "mashood.murtaza@gmail.com",
                                              password: "123456",
                                              repeatPassword: "123456")
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        //Act
        sut.proceedSignup(data: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFristNameValid)
        XCTAssertTrue(mockSignupModelValidator.isEmailVaild)
        XCTAssertTrue(mockSignupModelValidator.isPasswordVaild)
        XCTAssertTrue(mockSignupModelValidator.isPasswordMatched)
    }
}
