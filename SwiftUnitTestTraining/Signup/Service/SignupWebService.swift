//
//  SignupWebService.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 27/07/2025.
//

import Foundation

protocol SignupWebServiceType {
    func signup(with requestModel: SignupFormRequestModel,
                completion: @escaping (SignupResponseModel?, SignupError?) -> Void)
}

enum SignupError: Error {
    case responseModelParsingError
    case invalidRequestUrlStringError
    case inValidCharactors
}

final class SignupWebService: SignupWebServiceType {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func signup(with requestModel: SignupFormRequestModel,
                completion: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, SignupError.invalidRequestUrlStringError)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(requestModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            if let data, let signupResponse = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signupResponse, nil)
            }
            else {
                completion(nil, SignupError.responseModelParsingError)
            }
        }
        
        dataTask.resume()
    }
}
