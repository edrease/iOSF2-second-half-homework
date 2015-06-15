//
//  DetailViewController.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/14/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  
  var selectedPerson: Person!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      firstNameLabel.text = selectedPerson.firstName
      lastNameLabel.text = selectedPerson.lastName
    }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }

}
