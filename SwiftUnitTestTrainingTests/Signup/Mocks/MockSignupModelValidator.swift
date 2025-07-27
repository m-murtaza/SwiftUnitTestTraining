//
//  MockSignupModelValidator.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

class MockSignupModelValidator: SignupFormModelValidatorType {
    var isFristNameValid = false
    var isEmailVaild = false
    var isPasswordVaild = false
    var isPasswordMatched = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFristNameValid = true
        return isFristNameValid
    }
    
    func isFirstNameThrows(firstName: String) throws -> Bool {
        isFristNameValid = true
        return isFristNameValid
    }
    
    func isEmailVaild(email: String) -> Bool {
        isEmailVaild = true
        return isEmailVaild
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordVaild = true
        return isPasswordVaild
    }
    
    func isPasswordMatched(password: String, confirm: String) -> Bool {
        isPasswordMatched = true
        return isPasswordMatched
    }
}
