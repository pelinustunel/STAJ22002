//
//  LogViewController.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 27.07.2024.
//

import UIKit
import SQLite3



class LogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dbHelper = DatabaseHelper()
    var isLoadingData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "LogTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "LogTableCell")
        
        self.view.accessibilityIdentifier = "LogVC"

//        dbHelper.insert(projectID: "#5065",
//                        master: "mastercard",
//                        product: "production",
//                        checkUs: "Ozan,Berat,Waiting For Zafer",
//                        person: "Hüseyin Akdeniz",
//                        date: "26 Temmuz 2024, 14:50",
//                        status: "open")
        
        dbHelper.insert(projectID: "#5065", master: "mastercard", product: "production", checkUs: "Ozan, Berat, Waiting For Zafer", person: "Hüseyin Akdeniz", date: "26 Temmuz 2024, 14:50", status: "open")
        
  
        dbHelper.read()
        
        tableView.reloadData()
        
    }
    
    
    func loadData() {
        // Veri ön yükleneceği zaman
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoadingData = false
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dbHelper.projectAll.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogTableCell", for: indexPath) as! LogTableCell
        
        
        if indexPath.row < dbHelper.projectAll.count {
            let projectStatus = dbHelper.projectAll[indexPath.row]
            
            cell.fillCell(id: projectStatus.projectID,
                          master: projectStatus.master,
                          person: projectStatus.person,
                          statusS: projectStatus.status,
                          date: projectStatus.date,
                          check: projectStatus.checkUs,
                          product: projectStatus.product,
                          isLoading: false)
        } else {
            print("Index out of range: \(indexPath.row)")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
