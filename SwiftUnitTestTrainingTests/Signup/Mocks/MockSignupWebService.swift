//
//  MockSignupWebService.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

final class MockSignupWebService: SignupWebServiceType {
    var isSignupMethodCalled = false
    
    func signup(with requestModel: SignupFormRequestModel, completion: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        let response = SignupResponseModel(status: "Ok")
        completion(response, nil)
    }
}
