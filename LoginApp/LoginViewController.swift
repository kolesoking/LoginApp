//
//  ViewController.swift
//  LoginApp
//
//  Created by катя on 18.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeL = loginTextField.text
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
    

    @IBAction func signInButtonPressed() {
        if loginTextField.text == "User" && passwordTextField.text == "1234" {
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        } else {
            showAlert(
                with: "invalid login or password",
                and: "Please, enter correct login and password"
            )
        }
    }
    
    //MARK: - Show Alert
    @IBAction func showNameAlert(_ sender: Any) {
        showAlert(with: "Oops!", and: "your name is User \u{1F609}")
    }
    
    @IBAction func showAlertPassword(_ sender: Any) {
        showAlert(with: "Oops!", and: "your password is 1234 \u{1F609}")
    }
    
}

extension LoginViewController {
    
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            signInButtonPressed()
            }
        
        return true
    }
}

