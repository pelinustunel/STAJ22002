//
//  ApprovementsViewController.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 27.07.2024.
//

import UIKit


class ApprovementsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ApprovementContract{
    
    @IBOutlet weak var tableView: UITableView!
    
    var isLoadingData = true
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ApprovementsTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ApprovementsTableCell")
        tableView.reloadData()
        loadData()
        
        self.view.accessibilityIdentifier = "ApprovementVC"
    }
    
    func onAuthorize(response: StatusStruct) {
        
    }
    
    func onError(error: any Error) {
        
    }
 
    func loadData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoadingData = false
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApprovementsTableCell", for: indexPath) as! ApprovementsTableCell
        cell.fillCell(status: false, id: "#5065", master: "mastercard", person: "Hüseyin Akdeniz", statusS: "open", date: "26 Temmuz 2024, 14:50", check: "Ozan,Berat,Waiting For Zafer", product: "production", isLoading: isLoadingData)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
