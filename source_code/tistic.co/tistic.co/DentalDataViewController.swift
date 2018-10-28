//
//  DentalDataViewController.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/28/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import UIKit

class DentalDataViewController: UIViewController {

    var upperJaw = Dictionary<String, String>()
    var lowerJaw = Dictionary<String, String>()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func segmentControllerChanged(_ sender: Any) {
        print(segmentControl.selectedSegmentIndex)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var jawImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
        self.navigationItem.rightBarButtonItem = editButton
        self.navigationController?.navigationBar.prefersLargeTitles = true
        print(segmentControl.selectedSegmentIndex)
    }
   
    @objc private func toggleEditing() {
        let blockingSegmentNumber = self.segmentControl.selectedSegmentIndex == 0 ? 1 : 0

        if self.tableView.isEditing == true {
            self.segmentControl.setEnabled(true, forSegmentAt: blockingSegmentNumber)
        } else {
            self.segmentControl.setEnabled(false, forSegmentAt: blockingSegmentNumber)
        }
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        navigationItem.rightBarButtonItem?.title = self.tableView.isEditing ? "Done" : "Edit"
    }
}
