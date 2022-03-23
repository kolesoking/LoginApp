//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by катя on 23.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var nameAndSurname: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var aboutMeText: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    var nameUser: String!
    var surnameUser: String!
    var ageUser: String!
    var photoUser: String!
    var aboutUser: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameAndSurname.text = "\(nameUser ?? "None") \(surnameUser ?? "None")"
        age.text = "\(ageUser ?? "None") года"
        
        aboutMeText.text = aboutUser ?? "None"
        
        userPhoto.image = UIImage(named: photoUser ?? "None")
        
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
        
        
    }
}
    

