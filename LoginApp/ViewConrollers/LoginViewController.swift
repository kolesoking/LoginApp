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
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
    

    @IBAction func signInButtonPressed() {
        if loginTextField.text == user.login && passwordTextField.text == user.password {
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
        showAlert(with: "Oops!", and: "your name is \(user.login) \u{1F609}")
    }
    
    @IBAction func showAlertPassword(_ sender: Any) {
        showAlert(with: "Oops!", and: "your password is \(user.password) \u{1F609}")
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

