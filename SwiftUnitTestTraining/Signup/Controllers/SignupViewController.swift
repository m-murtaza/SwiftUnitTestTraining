//
//  SignupViewController.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 26/07/2025.
//

import UIKit

final class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

//MARK: - Actions
private extension SignupViewController {
    @objc func signupAction() {
        
    }
}

//MARK: - setup
private extension SignupViewController {
    func setupViews() {
        signupButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
    }
}
