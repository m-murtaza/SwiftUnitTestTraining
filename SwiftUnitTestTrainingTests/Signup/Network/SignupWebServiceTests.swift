//
//  SignupWebServiceTests.swift
//  SwiftUnitTestTrainingTests
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import XCTest
@testable import SwiftUnitTestTraining

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockUrlProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlSession: urlSession,
                                   urlString: "https://bit.ly/signup-mock-service-users")
        signupFormRequestModel = SignupFormRequestModel(firstName: "Mashood", lastName: "Murtaza", email: "mashood.murtaza@gmail.com", password: "qweasdzcx")
    }

    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockUrlProtocol.stubResponseData = nil
    }

    func testSignupWebService_whenGivenSuccessfulResponse_returnSuccess() {
        //Arrage
        let jsonString = "{\"status\":\"ok\"}"
        MockUrlProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup WebService Expectation")
        
        //Act
        sut.signup(with: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_whenReceivedDifferentJsonResponse_ErrorTookPlace() {
        //Arrage
        let jsonString = "{\"error\":\"Internal Server Error\"}"
        MockUrlProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup WebService Expectation")
        
        //Act
        sut.signup(with: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.responseModelParsingError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_whenEmptyUrlStringProvide_ReturnError() {
        //Arrage
        let expectation = self.expectation(description: "Signup WebService Expectation")
        sut = SignupWebService(urlString: "")
        
        //Act
        sut.signup(with: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.invalidRequestUrlStringError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}
