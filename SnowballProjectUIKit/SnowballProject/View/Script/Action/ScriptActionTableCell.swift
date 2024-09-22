//
//  ScriptActionTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

struct scriptActionItem {
    let actionName: String
}


class ScriptActionTableCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var items: [scriptActionItem] = [
        scriptActionItem(actionName: "Show History"),
        scriptActionItem(actionName: "Cancel Request"),
        scriptActionItem(actionName: "Change Status"),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UINib(nibName: ScriptActionCellRow.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ScriptActionCellRow.cellIdentifier)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScriptActionCellRow.cellIdentifier, for: indexPath) as! ScriptActionCellRow
        
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

