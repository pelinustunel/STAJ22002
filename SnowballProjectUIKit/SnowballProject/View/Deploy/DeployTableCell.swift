//
//  DeployTableViewCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 27.07.2024.
//

import UIKit

class DeployTableCell : UITableViewCell {
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var masterImage: UIImageView!
    @IBOutlet weak var miniStatusImage: UIImageView!
    
    @IBOutlet weak var masterView: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var personView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var masterShimmerView : ShimmerView!
    var productShimmerView : ShimmerView!
    var checkShimmerView : ShimmerView!
    var personShimmerView : ShimmerView!
    var dateShimmerView : ShimmerView!
    var rightShimmerView : ShimmerView!
    
    var idShimmerView : ShimmerView!
    var statusShimmerView : ShimmerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createShimmerViews()


    }
    
    
    
    func fillCell(status: Bool, id: String, master : String, person: String, statusS: String, date: String, check: String, product: String, isLoading: Bool) {
        idLabel.text = id
        masterLabel.text = master
        productLabel.text = product
        personLabel.text = person
        statusLabel.text = statusS
        dateLabel.text = date
        checkLabel.text = check
        
        if isLoading {
            startShimmering()
        } else {
            stopShimmering()
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
        
        // ShimmerView'leri ilgili view'ların bounds'larıyla uyumlu hale getirin
        productShimmerView.frame = productView.bounds
        masterShimmerView.frame = masterView.bounds
        checkShimmerView.frame = checkView.bounds
        personShimmerView.frame = personView.bounds
        dateShimmerView.frame = dateView.bounds
        rightShimmerView.frame = rightView.bounds
        idShimmerView.frame = idLabel.bounds
        statusShimmerView.frame = statusView.bounds
    }

    private func createShimmerViews() {
        
        // ShimmerView'leri oluşturun ve ilgili view'lara ekleyin
        productShimmerView = ShimmerView(frame: productView.bounds)
        masterShimmerView = ShimmerView(frame: masterView.bounds)
        checkShimmerView = ShimmerView(frame: checkView.bounds)
        personShimmerView = ShimmerView(frame: personView.bounds)
        dateShimmerView = ShimmerView(frame: dateView.bounds)
        rightShimmerView = ShimmerView(frame: rightView.bounds)
        idShimmerView = ShimmerView(frame: idLabel.bounds)
        statusShimmerView = ShimmerView(frame: statusView.bounds)
        
        productView.addSubview(productShimmerView)
        masterView.addSubview(masterShimmerView)
        checkView.addSubview(checkShimmerView)
        personView.addSubview(personShimmerView)
        dateView.addSubview(dateShimmerView)
        rightView.addSubview(rightShimmerView)
        idLabel.addSubview(idShimmerView)
        statusView.addSubview(statusShimmerView)
    }

    private func startShimmering() {
        // Tüm shimmerView'leri başlatın
        productShimmerView.startAnimating()
        masterShimmerView.startAnimating()
        checkShimmerView.startAnimating()
        personShimmerView.startAnimating()
        dateShimmerView.startAnimating()
        rightShimmerView.startAnimating()
        idShimmerView.startAnimating()
        statusShimmerView.startAnimating()
    }

    private func stopShimmering() {
        // Tüm shimmerView'leri durdurun
        productShimmerView.stopAnimating()
        masterShimmerView.stopAnimating()
        checkShimmerView.stopAnimating()
        personShimmerView.stopAnimating()
        dateShimmerView.stopAnimating()
        rightShimmerView.stopAnimating()
        idShimmerView.stopAnimating()
        statusShimmerView.stopAnimating()
    }
}

