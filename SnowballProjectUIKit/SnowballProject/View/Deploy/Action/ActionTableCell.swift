//
//  ActionTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

struct actionItem {
    let actionName: String
}


class ActionTableCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var items: [actionItem] = [
       actionItem(actionName: "Show History"),
       actionItem(actionName: "Cancel Request"),
       actionItem(actionName: "Change Status"),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UINib(nibName: ActionCellRow.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ActionCellRow.cellIdentifier)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionCellRow.cellIdentifier, for: indexPath) as! ActionCellRow
        
        let item = items[indexPath.row]
        cell.fillCell(actionName: item.actionName)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3.0
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
