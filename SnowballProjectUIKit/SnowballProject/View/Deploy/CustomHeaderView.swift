//
//  DeployDetailMainCustomHeaderVC.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 13.08.2024.
//

import UIKit

protocol CustomHeaderViewDelegate: AnyObject {
    func didTapImageView(in headerView: CustomHeaderView)
}

class CustomHeaderView: UITableViewHeaderFooterView {
    weak var delegate: CustomHeaderViewDelegate?
    
    let headerLabel = UILabel()
    let imageView = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLabel.textColor = .gray
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    
    
    @objc func imageTapped() {
        delegate?.didTapImageView(in: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
