//
//  DentalDataViewController.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/28/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import UIKit
import Foundation

class DentalDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,  UITextFieldDelegate {
    
    var upperJaw : [(Int, String)] = Array()
    var lowerJaw : [(Int, String)] = Array()
    
    weak var person: Person?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return upperJaw.count
        } else {
            return lowerJaw.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "dentalDescription", for: indexPath) as! DentalTableViewCell
        
        if self.segmentControl.selectedSegmentIndex == 0 {
            cell.number.text = String(upperJaw[indexPath.row].0)
            cell.dentDescription.text = upperJaw[indexPath.row].1
            
        } else {
            cell.number.text = String(lowerJaw[indexPath.row].0)
            cell.dentDescription.text = lowerJaw[indexPath.row].1
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if self.segmentControl.selectedSegmentIndex == 0 {
                self.upperJaw.remove(at: indexPath.row)
                self.person?.dentalData.setUpperJawInfo(tuples: self.upperJaw)
                self.person?.dentalData.writeData()
            } else {
                self.lowerJaw.remove(at: indexPath.row)
                self.person?.dentalData.setLowerJawInfo(tuples: self.lowerJaw)
                self.person?.dentalData.writeData()
            }
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
    @IBAction func addButtonPushed(_ sender: Any) {
        
        let addController = UIAlertController(title: "Adding a new record", message: "Please, input number of tooth and description of the problem", preferredStyle: .alert)
        addController.addTextField { (numTextField) in
            numTextField.placeholder = "Num"
            numTextField.delegate = self
            numTextField.keyboardType = UIKeyboardType.numberPad
        }
        addController.addTextField { (descriptionTextField) in
            descriptionTextField.placeholder = "Description"
        }
        addController.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak addController] (_) in
            let number = addController!.textFields![0]
            let description = addController!.textFields![1]
            if self.segmentControl.selectedSegmentIndex == 0 {
                if self.contains(array: self.upperJaw, value: Int(number.text!)!) {
                    let error = UIAlertController(title: "Error", message: "Inputed dental information already exists. Please delete it first.", preferredStyle: .alert)
                    error.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                    self.present(error, animated: true, completion: nil)
                    return
                }
                self.upperJaw.append((Int(number.text!)!, description.text!))
                self.upperJaw = self.upperJaw.sorted(by: {$0.0 < $1.0})
                self.person?.dentalData.setUpperJawInfo(tuples: self.upperJaw)
            } else {
                if self.contains(array: self.lowerJaw, value: Int(number.text!)!) {
                    let error = UIAlertController(title: "Error", message: "Inputed dental information already exists. Please delete it first.", preferredStyle: .alert)
                    error.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                    self.present(error, animated: true, completion: nil)
                    return
                }
                self.lowerJaw.append((Int(number.text!)!, description.text!))
                self.lowerJaw = self.lowerJaw.sorted(by: {$0.0 < $1.0})
                
                self.person?.dentalData.setLowerJawInfo(tuples: self.lowerJaw)
            }
            self.person?.dentalData.writeData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }))
        addController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(addController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func segmentControllerChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            jawImage.image = UIImage(named: "upper_with_nums")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case 1:
            jawImage.image = UIImage(named: "lower_with_nums")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        default:
            jawImage.image = nil
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var jawImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarVC = tabBarController as! MasterViewController
        person = tabBarVC.person
        jawImage.image = UIImage(named: "upper_with_nums")
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
        editButton.tintColor = UIColor(red:0.47, green:0.69, blue:0.44, alpha:1.0)
        self.navigationItem.leftBarButtonItem?.isEnabled = false;
        self.navigationItem.rightBarButtonItem = editButton
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.upperJaw = self.person!.dentalData.getUpperJawInfo()
        self.lowerJaw = self.person!.dentalData.getLowerJawInfo()
    
    }
   
    @objc private func toggleEditing() {
        let blockingSegmentNumber = self.segmentControl.selectedSegmentIndex == 0 ? 1 : 0

        if self.tableView.isEditing == true {
            self.segmentControl.setEnabled(true, forSegmentAt: blockingSegmentNumber)
            self.navigationItem.leftBarButtonItem?.isEnabled = false
        } else {
            self.segmentControl.setEnabled(false, forSegmentAt: blockingSegmentNumber)
            self.navigationItem.leftBarButtonItem?.isEnabled = true
        }
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        navigationItem.rightBarButtonItem?.title = self.tableView.isEditing ? "Save" : "Edit"
    }
    private func contains(array:[(Int, String)], value: Int) -> Bool {
        
        for (arrayValue, _) in array {
            if arrayValue == value {
                return true
            }
        }
        return false
    }
}
