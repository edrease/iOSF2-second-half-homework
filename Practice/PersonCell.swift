//
//  PersonCell.swift
//  Practice
//
//  Created by Edrease Peshtaz on 6/27/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
  
  @IBOutlet weak var personImage: UIImageView!
  
  @IBOutlet weak var firstNameLabel: UILabel!

  @IBOutlet weak var lastNameLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
