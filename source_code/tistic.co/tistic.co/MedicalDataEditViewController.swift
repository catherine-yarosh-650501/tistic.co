//
//  MedicalDataEditViewController.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/28/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import UIKit

class MedicalDataEditViewController: UIViewController {
    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var diseasesTextView: UITextView!
    @IBOutlet weak var medicamentsTextView: UITextView!
    @IBOutlet weak var allergyTextView: UITextView!
    weak var person: Person?
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        person?.basicInfo.setAllergy(text: self.allergyTextView.text)
        person?.basicInfo.setDiseases(text: self.diseasesTextView.text)
        person?.basicInfo.setMedicaments(text: self.medicamentsTextView.text)
        self.view.endEditing(true)
        person?.basicInfo.writeData()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func openHealthAppTapped(_ sender: Any) {
        if let appURL = URL(string: "x-apple-health://") {
            let canOpen = UIApplication.shared.canOpenURL(appURL)
            if  canOpen == true {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                let alert = UIAlertController(title: "Attention", message: "Error occured", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personPhoto.contentMode = .scaleAspectFill
        self.personPhoto.layer.cornerRadius = 39
        self.personPhoto.layer.masksToBounds = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.birthdayLabel.text = "Birthday: " + (person?.getBirthday())!
        self.personPhoto.image = UIImage(data: (person?.getImage())!)
        self.nameLabel.text = person?.getName()
        self.surnameLabel.text = person?.getSurname()
        self.sexLabel.text = "Sex: " + (person?.basicInfo.getBiologicalSex())!
        self.diseasesTextView.text = (person?.basicInfo.getDiseases())!
        self.allergyTextView.text = (person?.basicInfo.getAllergy())!
        self.medicamentsTextView.text = (person?.basicInfo.getMedicaments())!
    }
}
