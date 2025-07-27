//
//  SignupViewController.swift
//  SwiftUnitTestTraining
//
//  Created by Mashud Murtaza on 26/07/2025.
//

import UIKit

final class SignupViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    //MARK: - Properties
    var signupPresenter: SignupPresenterType?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signupPresenter == nil {
            let signupFormModelValidator = SignupFormModelValidator()
            let signupWebService = SignupWebService(urlString: "")
            signupPresenter = SignupPresenter(formModelValidator: signupFormModelValidator,
                                              webService: signupWebService,
                                              delegate: self)
        }
        setupViews()
    }
}

//MARK: - Actions
private extension SignupViewController {
    @objc func signupAction() {
        let signupFormModel = SignupFormModel(firstName: firstNameField.text ?? "",
                                              lastName: lastNameField.text ?? "",
                                              email: emailField.text ?? "",
                                              password: passwordField.text ?? "",
                                              repeatPassword: repeatPasswordField.text ?? "")
        signupPresenter?.proceedSignup(data: signupFormModel)
    }
}

//MARK: - setup
private extension SignupViewController {
    func setupViews() {
        firstNameField.placeholder = "First Name"
        firstNameField.accessibilityIdentifier = "firstname"
        lastNameField.accessibilityIdentifier = "lastname"
        emailField.placeholder = "Email"
        emailField.accessibilityIdentifier = "email"
        emailField.keyboardType = .emailAddress
        emailField.textContentType = .emailAddress
        passwordField.placeholder = "Password"
        passwordField.accessibilityIdentifier = "password"
        passwordField.isSecureTextEntry = true
        repeatPasswordField.accessibilityIdentifier = "repeatPassword"
        repeatPasswordField.isSecureTextEntry = true
        signupButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        signupButton.accessibilityIdentifier = "submit"
    }
}

//MARK: -
extension SignupViewController: SignupViewDelgateProtocol {
    func success() {
        
    }
    
    func failure(error: SignupError) {
        let alert = UIAlertController(title: "Alert", message: "Error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
