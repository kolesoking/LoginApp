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
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameAndSurname.text = "\(user.infoUser.fullName)"
        age.text = "\(user.infoUser.age) года"
        
        aboutMeText.text = user.infoUser.aboutMe
        
        userPhoto.image = UIImage(named: user.infoUser.photo)
        
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "moreInfoVC" else { return }
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return}
        moreInfoVC.user = user
    }
    
}
    

