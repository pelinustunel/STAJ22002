//
//  EnvironmentTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

struct environmentItem {
    let environmentName: String
    let environmentIcon : UIImage
}


class EnvironmentTableCell : UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [environmentItem] = [
      environmentItem(environmentName: "PRODUCTION", environmentIcon: UIImage(systemName: "exclamationmark.circle")!),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "EnvironmentRowCell", bundle: nil), forCellReuseIdentifier: "EnvironmentRowCell")

   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EnvironmentRowCell", for: indexPath) as! EnvironmentRowCell
        let item = items[indexPath.row]
        cell.fillCell(label: item.environmentName, icon: item.environmentIcon)
        return cell
    }
    

    

}
