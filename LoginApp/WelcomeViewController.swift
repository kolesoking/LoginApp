//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by катя on 18.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(welcomeL ?? "None")"
        
    }
    
    @IBAction func signOutAction() {
        dismiss(animated: true)
    }
    
}
