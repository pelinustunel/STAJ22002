//
//  EnvironmentTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

struct scriptEnvironmentItem {
    let environmentName: String
    let environmentIcon : UIImage
}


class ScriptEnvironmentTableCell : UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [scriptEnvironmentItem] = [
        scriptEnvironmentItem(environmentName: "UAT", environmentIcon: UIImage(systemName: "exclamationmark.circle")!),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ScriptEnvironmentRowCell", bundle: nil), forCellReuseIdentifier: "ScriptEnvironmentRowCell")

   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptEnvironmentRowCell", for: indexPath) as! ScriptEnvironmentRowCell
        let item = items[indexPath.row]
        cell.fillCell(label: item.environmentName, icon: item.environmentIcon)
        return cell
    }
    

    

}

