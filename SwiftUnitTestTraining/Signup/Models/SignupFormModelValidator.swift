//
//  SignupFormModelValidator.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

protocol SignupFormModelValidatorType {
    func isFirstNameValid(firstName: String) -> Bool
    func isFirstNameThrows(firstName: String) throws -> Bool
    func isEmailVaild(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func isPasswordMatched(password: String, confirm: String) -> Bool
}

final class SignupFormModelValidator: SignupFormModelValidatorType {
    
    enum Constants {
        static let firstNameMinLength = 3
        static let firstNameMaxLength = 10
        static let passwordMinLength = 3
        static let passwordMaxLength = 10
        static let invalidCharatorSet = CharacterSet(charactersIn: "{}!@£$%^&&*()")
    }
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        if firstName.count < Constants.firstNameMinLength || firstName.count > Constants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isFirstNameThrows(firstName: String) throws -> Bool {
        var returnValue = true
        
        if firstName.rangeOfCharacter(from: Constants.invalidCharatorSet) != nil {
            throw SignupError.inValidCharactors
        }
        
        if firstName.count < Constants.firstNameMinLength || firstName.count > Constants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailVaild(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
            .evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        if password.count < Constants.passwordMinLength || password.count > Constants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordMatched(password: String, confirm: String) -> Bool {
        return password == confirm
    }
}
