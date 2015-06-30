//
//  ViewController.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/13/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit
import QuartzCore

class ListViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var namesArray = [Person]()
  let amuro = Person(firstName: "Amuro", lastName: "Ray")
  let char = Person(firstName: "Char", lastName: "Aznable")
  let sayla = Person(firstName: "Sayla", lastName: "Mass")
  let frau = Person(firstName: "Frau", lastName: "Bow")
  let bright = Person(firstName: "Bright", lastName: "Noa")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    
    if let peopleFromArchive = loadFromArchive() {
      namesArray = peopleFromArchive
    } else {
      loadPeopleFromPList()
      saveToArchive()
    }
//    namesArray.append(amuro)
//    namesArray.append(char)
//    namesArray.append(sayla)
//    namesArray.append(frau)
//    namesArray.append(bright)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    saveToArchive()
    tableView.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func loadPeopleFromPList() {
    if let peoplePath = NSBundle.mainBundle().pathForResource("PeopleList", ofType: "plist"), peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : String]] {
      
      for object in peopleObjects {
        if let firstName = object["firstName"], lastName = object["lastName"] {
          let person = Person(firstName: firstName, lastName: lastName)
          namesArray.append(person)
        }
      }
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return namesArray.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    cell.backgroundColor = UIColor.whiteColor()
    cell.personImage.layer.cornerRadius = (35/2)
    cell.personImage.layer.masksToBounds = true
    cell.personImage.layer.shadowOpacity = 0.5
    cell.personImage.layer.shadowOffset = CGSizeMake(1, -1)
    cell.personImage.layer.shadowRadius = 5
    cell.personImage.layer.shadowColor = UIColor.blackColor() as! CGColorRef
    let personToDisplay = namesArray[indexPath.row]
    cell.firstNameLabel.text = personToDisplay.firstName
    cell.lastNameLabel.text = personToDisplay.lastName
    
    if let image = personToDisplay.picture {
      cell.personImage.image = image
    }
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toDetailController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        if let indexPath = tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedPerson = namesArray[selectedRow]
          detailViewController.selectedPerson = selectedPerson
        }
      }
    }
  }
  
  func saveToArchive() {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last as? String {
      NSKeyedArchiver.archiveRootObject(namesArray, toFile: documentsPath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last as? String {
      if let peopleListFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person] {
        return peopleListFromArchive
      }
    }
    return nil
  }
  
}

