//
//  SignupPresenter.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

final class SignupPresenter {
    private var formModelValidator: SignupFormModelValidatorType
    private var webService: SignupWebServiceType
    
    init(formModelValidator: SignupFormModelValidatorType, webService: SignupWebServiceType) {
        self.formModelValidator = formModelValidator
        self.webService = webService
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
        
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: data.firstName,
            lastName: data.lastName,
            email: data.email,
            password: data.password)
        
        webService.signup(with: signupFormRequestModel) { response, error in
            //TODO
        }
    }
}
