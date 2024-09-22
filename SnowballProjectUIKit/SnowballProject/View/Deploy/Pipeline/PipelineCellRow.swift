//
//  PipelineCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 5.08.2024.
//

import UIKit



class PipelineCellRow : UICollectionViewCell {
    
    static let cellIdentifier = String(describing: PipelineCellRow.self)
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var localContainerView: UIStackView!
    @IBOutlet weak var statusNameLabel: UILabel!
    @IBOutlet weak var openCheckLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 5.0
        containerView.layer.masksToBounds = true
        
    }
    
    
    func fillCell(field: String, statusName: String, openCheck: String, id: String) {
        fieldNameLabel.text = field
        statusNameLabel.text = statusName
        openCheckLabel.text = openCheck
        idLabel.text = id
        
    }
    
}
