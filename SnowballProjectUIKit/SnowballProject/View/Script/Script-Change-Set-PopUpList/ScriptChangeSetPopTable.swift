//
//  ScriptChangeSetPopTable.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

struct scriptChangeSetPopItem {
    let id: String
    let description: String
}


class ScriptChangeSetPopTable : UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [scriptChangeSetPopItem] = [
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        scriptChangeSetPopItem(id: "[Dp-552]", description: "Transaction reporting ekranındaki sql sorgusunun iyileştirilmesi"),
        
    ]
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ScriptChangeSetPopTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ScriptChangeSetPopTableCell")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptChangeSetPopTableCell", for: indexPath) as! ScriptChangeSetPopTableCell
        
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

