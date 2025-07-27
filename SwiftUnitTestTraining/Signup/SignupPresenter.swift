//
//  SignupPresenter.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

final class SignupPresenter {
    private var formModelValidator: SignupFormModelValidatorType
    
    init(formModelValidator: SignupFormModelValidatorType) {
        self.formModelValidator = formModelValidator
    }
    
    func proceedSignup(data: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: data.firstName) {
            return
        }
        
        if !formModelValidator.isEmailVaild(email: data.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: data.password) {
            return
        }
        
        if !formModelValidator.isPasswordMatched(password: data.password, confirm: data.repeatPassword) {
            return
        }
    }
}
