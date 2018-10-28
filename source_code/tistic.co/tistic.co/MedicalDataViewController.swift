//
//  MedicalInfoViewController.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/28/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import UIKit

class MedicalDataViewController: UIViewController {

    @IBOutlet weak var personPhoto: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personPhoto.contentMode = .scaleAspectFill
        self.personPhoto.layer.cornerRadius = 43
        self.personPhoto.layer.masksToBounds = true
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
