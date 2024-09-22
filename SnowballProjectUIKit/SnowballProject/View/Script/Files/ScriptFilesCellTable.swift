//
//  ScriptFilesCellTable.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 15.08.2024.
//

import UIKit

struct scriptFilesItem {
    let fileName: String
    let version: String
    let status: String
}

class ScriptFilesCellTable : UITableViewCell, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [scriptFilesItem] = [
        scriptFilesItem(fileName: "delete_record.sql", version: "version 1.0", status: "Approved"),
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ScriptFilesCellRow", bundle: nil), forCellReuseIdentifier: "ScriptFilesCellRow")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptFilesCellRow", for: indexPath) as! ScriptFilesCellRow
        let item = items[indexPath.row]
        cell.fillCell(name: item.fileName, status: item.status, version: item.version)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Burada detay sayfasına gitme işlemi yapacaksınız
            if let parentViewController = self.parentViewController {
                let detailViewController = FilesConfirmationTableCell()
                parentViewController.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    

}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
