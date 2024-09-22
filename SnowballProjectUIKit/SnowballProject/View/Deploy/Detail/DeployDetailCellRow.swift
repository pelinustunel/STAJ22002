//
//  DeployDetailCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 4.08.2024.
//

import UIKit


class DeployDetailCellRow : UITableViewCell {
    
    @IBOutlet weak var detailIcon: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var fieldName: UILabel!
    
    @IBOutlet weak var containerView: UIStackView!
    
    
    func fillCell(icon: UIImage, name: String, field: String) {
        
        detailIcon.image = icon
        detailName.text = name
        fieldName.text = field
        
        
        containerView.layer.cornerRadius = 15
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.masksToBounds = false
        
    }
    
    
}
