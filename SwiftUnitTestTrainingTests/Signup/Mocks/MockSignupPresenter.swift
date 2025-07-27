//
//  MockSignupPresenter.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

class MockSignupPresenter: SignupPresenterType {
    var isProcessSignupCalled: Bool = false
    
    required init(formModelValidator: SignupFormModelValidatorType, webService: SignupWebServiceType, delegate: SignupViewDelgateProtocol?) {
        
    }
    
    func proceedSignup(data: SignupFormModel) {
        isProcessSignupCalled = true
    }
}
