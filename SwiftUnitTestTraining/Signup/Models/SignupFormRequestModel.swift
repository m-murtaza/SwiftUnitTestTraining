//
//  SignupFormRequestModel.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
