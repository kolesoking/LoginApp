//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by катя on 23.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    

    @IBOutlet weak var personalInterests: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalInterests.text = user.infoUser.interests

    }
    
}
