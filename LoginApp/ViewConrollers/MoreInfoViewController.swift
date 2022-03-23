//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by катя on 23.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    

    @IBOutlet weak var personalInterests: UILabel!
    
    var interests: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalInterests.text = interests ?? "None"

    }
    
}
