//
//  LogShimmerTableView.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 31.07.2024.
//

import UIKit

class LogShimmerTableCell : UITableViewCell {
    
    var shimmerView: ShimmerView!
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var rightStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    @IBOutlet weak var centerStackView: UIView!
    @IBOutlet weak var leftStackView: UIStackView!
    
    var topShimmerView: ShimmerView!
    var rightShimmerView: ShimmerView!
    var bottomShimmerView: ShimmerView!
    var centerShimmerView: ShimmerView!
    var leftShimmerView: ShimmerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialize and add shimmer views to each stack view
        topShimmerView = ShimmerView(frame: topStackView.bounds)
        topStackView.addSubview(topShimmerView)
        topShimmerView.startAnimating()
        
        rightShimmerView = ShimmerView(frame: rightStackView.bounds)
        rightStackView.addSubview(rightShimmerView)
        rightShimmerView.startAnimating()
        
        bottomShimmerView = ShimmerView(frame: bottomStackView.bounds)
        bottomStackView.addSubview(bottomShimmerView)
        bottomShimmerView.startAnimating()
        
        centerShimmerView = ShimmerView(frame: centerStackView.bounds)
        centerStackView.addSubview(centerShimmerView)
        centerShimmerView.startAnimating()
        
        leftShimmerView = ShimmerView(frame: leftStackView.bounds)
        leftStackView.addSubview(leftShimmerView)
        leftShimmerView.startAnimating()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Remove existing shimmer layers before reusing
        topShimmerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        topShimmerView.startAnimating()
        
        rightShimmerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        rightShimmerView.startAnimating()
        
        bottomShimmerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        bottomShimmerView.startAnimating()
        
        centerShimmerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        centerShimmerView.startAnimating()
        
        leftShimmerView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        leftShimmerView.startAnimating()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 10
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
        // Update frames to match the bounds of the stack views
        topShimmerView.frame = topStackView.bounds
        rightShimmerView.frame = rightStackView.bounds
        bottomShimmerView.frame = bottomStackView.bounds
        centerShimmerView.frame = centerStackView.bounds
        leftShimmerView.frame = leftStackView.bounds
    }
}
