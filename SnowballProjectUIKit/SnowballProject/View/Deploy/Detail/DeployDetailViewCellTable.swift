//
//  DeployDetailViewCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 2.08.2024.
//

import UIKit

struct Item {
    let icon: UIImage
    let name: String
    let field: String
}

class DeployDetailViewCellTable : UITableViewCell, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [Item] = [
        Item(icon: UIImage(systemName: "tag")!, name: "Deployment-[3804]", field: "ID"),
        Item(icon: UIImage(systemName: "creditcard")!, name: "Mastercard", field: "Customer"),
        Item(icon: UIImage(systemName: "archivebox")!, name: "SoftPos White Label", field: "Product"),
        Item(icon: UIImage(systemName: "network")!, name: "UX.Web", field: "Host"),
        Item(icon: UIImage(systemName: "checkmark")!, name: "Waiting Approvement", field: "Approvement"),
        Item(icon: UIImage(systemName: "scope")!, name: "C:/Inetpub/wwwroot/uat/v2/ux.web", field: "Target Path"),
        Item(icon: UIImage(systemName: "checkmark.circle.fill")!, name: "Open", field: "Status"),
        Item(icon: UIImage(systemName: "rectangle.fill.on.rectangle.fill")!, name: "0", field: "Version"),
        Item(icon: UIImage(systemName: "pencil.and.list.clipboard")!, name: "Erkan Kılıç", field: "Created By"),
        Item(icon: UIImage(systemName: "bubble.fill")!, name: "Description", field: "Description")
    ]
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.register(UINib(nibName: "DeployDetailCellRow", bundle: nil), forCellReuseIdentifier: "DeployDetailCellRow")
        

        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.layer.cornerRadius = 10.0
        tableView.layer.masksToBounds = true

       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeployDetailCellRow", for: indexPath) as! DeployDetailCellRow
        let item = items[indexPath.row]
        cell.fillCell(icon: item.icon, name: item.name, field: item.field)
        return cell
        
    }
    
}
