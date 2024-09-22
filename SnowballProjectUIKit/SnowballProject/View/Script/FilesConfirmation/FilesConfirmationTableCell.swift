//
//  FilesConfirmationTableCell.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 17.08.2024.
//

import UIKit

class FilesConfirmationTableCell : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var height = UIScreen.main.bounds.height
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fileContent: UIButton!
    @IBOutlet weak var changeStatus: UIButton!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
       
        tableView.register(UINib(nibName: "FilesConfirmationCellRow", bundle: nil), forCellReuseIdentifier: "FilesConfirmationCellRow")


    }
    
 
    
    
    @IBAction func changeStatusClick(_ sender: Any) {
      
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilesConfirmationCellRow", for: indexPath) as! FilesConfirmationCellRow
        cell.fillCell(name: "File Name", nameResult: "PDZ-5125.sql", version: "Version", versionResult: "1.0", size: "Size", sizeResult: "149 B", status: "Status")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
