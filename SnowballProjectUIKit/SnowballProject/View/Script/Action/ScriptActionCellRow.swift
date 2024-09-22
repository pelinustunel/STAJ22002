//
//  ScriptActionCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

class ScriptActionCellRow : UICollectionViewCell {
    
    static let cellIdentifier = String(describing: ScriptActionCellRow.self)
    
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
