//
//  ActionCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

class ActionCellRow : UICollectionViewCell {
    
    static let cellIdentifier = String(describing: ActionCellRow.self)
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var actionLabel: UILabel!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
        
   
    }
    
  
    
    func fillCell(actionName : String) {
        actionLabel.text = actionName
    }
}
