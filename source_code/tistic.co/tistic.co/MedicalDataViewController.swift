//
//  MedicalInfoViewController.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/28/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import UIKit
import HealthKit

class MedicalDataViewController: UIViewController {
    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var diseasesLabel: UILabel!
    @IBOutlet weak var allergyLabel: UILabel!
    @IBOutlet weak var medicamentsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var summaryJawInfo: [(Int, String)] = Array()
    weak var person: Person?
    let healthKitStore = HKHealthStore()
    
    override func viewWillAppear(_ animated: Bool) {
        self.birthdayLabel.text = "Birthday: " + person!.getBirthday()
        self.personPhoto.image = UIImage(data: person!.getImage())
        self.nameLabel.text = person!.getName()
        self.surnameLabel.text = person!.getSurname()
        self.bloodTypeLabel.text = "Blood type: " + person!.basicInfo.getBloodType()
        
        self.sexLabel.text = "Sex: " + person!.basicInfo.getBiologicalSex()
        self.weightLabel.text = "Weight: " + String(format: "%.1f", person!.basicInfo.getWeight()) + " kg"
        self.heightLabel.text = "Height: " + String(format: "%.1f", person!.basicInfo.getHeight()) + " cm"
        
        self.diseasesLabel.text = "Diseases: " + person!.basicInfo.getDiseases()
        self.allergyLabel.text = "Allergy: " + person!.basicInfo.getAllergy()
        self.medicamentsLabel.text = "Medicaments: " + person!.basicInfo.getMedicaments()
        self.summaryJawInfo = (person?.dentalData.getUpperJawInfo())! + (person?.dentalData.getLowerJawInfo())!
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person = Person.instance
        self.personPhoto.contentMode = .scaleAspectFill
        self.personPhoto.layer.cornerRadius = 43
        self.personPhoto.layer.masksToBounds = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.editButton.tintColor = UIColor(red:0.47, green:0.69, blue:0.44, alpha:1.0)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let rootViewController = segue.destination as? UINavigationController
            let editViewController = rootViewController?.viewControllers.first as! MedicalDataEditViewController
            editViewController.person = self.person
        }
    }
}

extension MedicalDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dentalSummary", for: indexPath) as! SummaryTableViewCell
        cell.toothDescription.text = summaryJawInfo[indexPath.row].1
        cell.number.text = String(summaryJawInfo[indexPath.row].0)
        return cell
    }
}

extension MedicalDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summaryJawInfo.count
    }
}
