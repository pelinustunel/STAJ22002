//
//  ShimmerView.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 31.07.2024.
//

import UIKit

import UIKit

class ShimmerView: UIView {
    
    var gradientColorOne: CGColor = UIColor(white: 0.80, alpha: 1.0).cgColor
    var gradientColorTwo: CGColor = UIColor(white: 0.90, alpha: 1.0).cgColor
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.forEach { layer in
            if let gradientLayer = layer as? CAGradientLayer {
                gradientLayer.frame = self.bounds
            }
        }
    }
    
    func addGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        return gradientLayer
    }
    
    func addAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }
    
    func startAnimating() {
        self.layoutIfNeeded()
        
        if let existingLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer {
            let animation = addAnimation()
            existingLayer.add(animation, forKey: animation.keyPath)
        } else {
            
            let gradientLayer = addGradientLayer()
            let animation = addAnimation()
            gradientLayer.add(animation, forKey: animation.keyPath)
        }
    }
    
    func stopAnimating() {
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
    }
}
