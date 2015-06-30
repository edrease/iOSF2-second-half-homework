//
//  Person.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/14/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
  var firstName: String
  var lastName: String
  var picture: UIImage?
  
  init (firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  required init(coder aDecoder: NSCoder) {
    firstName = aDecoder.decodeObjectForKey("firstName") as! String
    lastName = aDecoder.decodeObjectForKey("lastName") as! String
    picture = aDecoder.decodeObjectForKey("picture") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(firstName, forKey: "firstName")
    aCoder.encodeObject(lastName, forKey: "lastName")
    aCoder.encodeObject(picture, forKey: "picture")
  }
  
}
