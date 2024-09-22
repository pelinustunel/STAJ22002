//
//  ScriptChangeSetTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

struct scriptChangeSetItem {
    let id: String
    let description: String
}


class ScriptChangeSetTableCell :UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var items: [scriptChangeSetItem] = [
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UINib(nibName: ChangeSetCellRow.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ChangeSetCellRow.cellIdentifier)
   
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChangeSetCellRow.cellIdentifier, for: indexPath) as! ChangeSetCellRow
        
        let item = items[indexPath.row]
        cell.fillCell(description: item.description, id: item.id)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1.5
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
}
