//
//  SignupViewDelgateProtocol.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

protocol SignupViewDelgateProtocol: AnyObject {
    func success()
    func failure(error: SignupError)
}
