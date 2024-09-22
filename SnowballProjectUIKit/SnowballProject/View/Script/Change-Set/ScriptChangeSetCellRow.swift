//
//  ScriptChangeSetCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

class ScriptChangeSetCellRow : UICollectionViewCell {
    
    static let cellIdentifier = String(describing: ScriptChangeSetCellRow.self)
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentLabel.numberOfLines = 0
        commentLabel.sizeToFit()

        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
    }
    
    func fillCell(description: String, id: String){
        commentLabel.text = description
        idLabel.text = id
        
    }
    
}
