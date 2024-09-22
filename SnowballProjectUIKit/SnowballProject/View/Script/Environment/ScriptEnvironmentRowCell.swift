//
//  EnvironmentRowCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

class ScriptEnvironmentRowCell : UITableViewCell {
    

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var environmentLabel: UILabel!
    @IBOutlet weak var environmentIcon: UIImageView!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
        environmentIcon.tintColor = UIColor.white
      
        
    }
    
    func fillCell(label : String, icon: UIImage) {
        environmentLabel.text = label
        environmentIcon.image = icon
    }
}
