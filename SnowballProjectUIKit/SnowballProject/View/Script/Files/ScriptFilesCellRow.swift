//
//  ScriptFilesCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

class ScriptFilesCellRow : UITableViewCell {
    

  
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!

    @IBOutlet weak var chevronIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var buttonContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fileNameLabel.numberOfLines = 0
        fileNameLabel.sizeToFit()

        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
        
        buttonContainerView.layer.cornerRadius = 10.0
        
    
    }
    
    func fillCell(name: String, status: String, version: String){
        fileNameLabel.text = name
        statusLabel.text = status
        versionLabel.text = version
        
    }
    

    
}
