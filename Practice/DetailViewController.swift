//
//  DetailViewController.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/14/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  
  var selectedPerson: Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstNameTextField.delegate = self
    lastNameTextField.delegate = self
    firstNameTextField.text = selectedPerson.firstName
    lastNameTextField.text = selectedPerson.lastName
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      selectedPerson.firstName = textField.text
    } else {
      selectedPerson.lastName = textField.text
    }
  }
  
  @IBAction func cameraButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    if let picture = info[UIImagePickerControllerEditedImage] as? UIImage {
      imageView.image = picture
      selectedPerson.picture = picture
    
    picker.dismissViewControllerAnimated(true, completion: nil)
    }
  }
}
