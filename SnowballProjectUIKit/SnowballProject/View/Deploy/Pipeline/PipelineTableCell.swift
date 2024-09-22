//
//  PipelineTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 5.08.2024.
//

import UIKit

struct pipelineItem {
    let field: String
    let statusName: String
    let openCheck: String
    let id: String
}

class PipelineTableCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var items: [pipelineItem] = [
        pipelineItem(field: "DEVELOPMENT", statusName: "Local Side", openCheck: "CLOSE", id: "[Deployment-3799]"),
        pipelineItem(field: "CUSTOMER TEXT", statusName: "Customer Side", openCheck: "CLOSE", id: "[Deployment-3800]"),
        pipelineItem(field: "UAT", statusName: "Customer Side", openCheck: "OPEN", id: "[Deployment-3804]"),
        pipelineItem(field: "PRODUCTION", statusName: "", openCheck: "", id: ""),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UINib(nibName: PipelineCellRow.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PipelineCellRow.cellIdentifier)
 
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PipelineCellRow.cellIdentifier, for: indexPath) as! PipelineCellRow
        
        let item = items[indexPath.row]
        cell.fillCell(field: item.field, statusName: item.statusName, openCheck: item.openCheck, id: item.id)
        
        
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            cell.arrowImage.isHidden = true
        }
           
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1.5
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
}
