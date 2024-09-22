//
//  ChangeSetPopTable.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 13.08.2024.
//

import UIKit

struct changeSetPopItem {
    let id: String
    let description: String
}


class ChangeSetPopTable : UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [changeSetPopItem] = [
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        changeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        
    ]
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ChangeSetPopTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChangeSetPopTableCell")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSetPopTableCell", for: indexPath) as! ChangeSetPopTableCell
        
        let item = items[indexPath.row]
        cell.fillCell(description: item.description, id: item.id)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
