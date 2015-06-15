//
//  ViewController.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/13/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

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
    
    namesArray.append(amuro)
    namesArray.append(char)
    namesArray.append(sayla)
    namesArray.append(frau)
    namesArray.append(bright)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return namesArray.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let nameToDisplay = namesArray[indexPath.row]
    cell.textLabel?.text = nameToDisplay.firstName + " " + nameToDisplay.lastName
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toDetailController" {
      let detailViewController = segue.destinationViewController as! DetailViewController
      let indexPath = tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPerson = namesArray[selectedRow]
      detailViewController.selectedPerson = selectedPerson
      
    }
    
  }
  
}

