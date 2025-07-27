//
//  SignupPresenter.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

protocol SignupPresenterType: AnyObject {
    init(formModelValidator: SignupFormModelValidatorType, webService: SignupWebServiceType, delegate: SignupViewDelgateProtocol?)
    func proceedSignup(data: SignupFormModel)
}

class SignupPresenter: SignupPresenterType {
    private var formModelValidator: SignupFormModelValidatorType
    private var webService: SignupWebServiceType
    private weak var delegate: SignupViewDelgateProtocol?
    
    required init(formModelValidator: SignupFormModelValidatorType, webService: SignupWebServiceType, delegate: SignupViewDelgateProtocol?) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
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
        
        webService.signup(with: signupFormRequestModel) { [weak self] response, error in
            if let _ = response {
                self?.delegate?.success()
            }
        }
    }
}
