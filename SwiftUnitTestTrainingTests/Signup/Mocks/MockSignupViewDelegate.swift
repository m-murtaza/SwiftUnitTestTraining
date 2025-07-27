//
//  MockSignupViewDelegate.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

final class MockSignupViewDelegate: SignupViewDelgateProtocol {
    var expactation: XCTestExpectation?
    var successfulCounter = 0
    
    func success() {
        successfulCounter += 1
        expactation?.fulfill()
    }
    
    func failure(error: SignupError) {
        //TODO
    }
}
