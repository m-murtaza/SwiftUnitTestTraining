//
//  SignupFormModelValidatorTests.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Mashood")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "isFirstNameValid should return true but it returns false")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "M")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "isFirstNameValid should return false")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "MashoodMashoodMashood")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "isFirstNameValid should return false")
    }
    
    func testSignupFormModelValidator_WhenEmailProvided_ShouldReturnTrue() {
        //Act
        let isEmailValid = sut.isEmailVaild(email: "mashood.murtaza@gmail.com")
        //Assert
        XCTAssertTrue(isEmailValid, "email should return true")
    }
    
    func testSignupFormModelValidator_WhenPasswordProvided_ShouldReturnTrue() {
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "qweasdzxc")
        //Assert
        XCTAssertTrue(isPasswordValid, "password should return true")
    }
    
    func testSignupFormModelValidator_WhenPasswordMatched_ShouldReturnTrue() {
        //Act
        let isPasswordMatched = sut.isPasswordMatched(password: "qweasdzxc", confirm: "qweasdzxc")
        //Assert
        XCTAssertTrue(isPasswordMatched, "password and confirm password should matched")
    }
    
    func testSignupFormModelValidator_WhenFirstNameWithInValidCharactorsProvided_ShouldReturnThrows() {
        XCTAssertThrowsError(try sut.isFirstNameThrows(firstName: "Mashood&"), "method should throws an error") { (error) in
            XCTAssertEqual(error as? SignupError, SignupError.inValidCharactors)
        }
    }
    
    func testSignupFormModelValidator_WhenFirstNameWithValidCharactorsProvided_ShouldReturnNoThrows() {
        XCTAssertNoThrow(try sut.isFirstNameThrows(firstName: "Mashood"), "method should not throws an error")
    }
}
