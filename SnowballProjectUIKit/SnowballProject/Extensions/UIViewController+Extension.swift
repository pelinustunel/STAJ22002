//
//  UIViewController+Extension.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 28.07.2024.
//

import UIKit

extension UIViewController {
    
    func setupTitleView() {
        let titleImage = UIImage(named: "snowballicon")
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = "Snowball"
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor(.white)
        
        let titleView = UIView()
        titleView.addSubview(titleImageView)
        titleView.addSubview(titleLabel)
        
        
        let totalWidth = titleImageView.frame.width + titleLabel.frame.width + 8
        let totalHeight = max(titleImageView.frame.height, titleLabel.frame.height)
        
        titleView.frame = CGRect(x: 0, y: 0, width: totalWidth, height: totalHeight)
        
        titleImageView.frame.origin = CGPoint(x: 0, y: (totalHeight - titleImageView.frame.height) / 2)
        titleLabel.frame.origin = CGPoint(x: titleImageView.frame.maxX + 8, y: (totalHeight - titleLabel.frame.height) / 2)
        
        self.navigationController?.navigationBar.topItem?.titleView = titleView
    }
}
