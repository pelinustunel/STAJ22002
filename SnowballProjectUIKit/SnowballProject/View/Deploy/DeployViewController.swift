//
//  DeployViewController.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 26.07.2024.
//

import UIKit

class DeployViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isLoadingData = true
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "DeployTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DeployTableCell")
        tableView.reloadData()
        
        loadData()
        
    }
    
    
    func loadData() {
        // Veri ön yükleneceği zaman
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoadingData = false
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeployTableCell", for: indexPath) as! DeployTableCell
        cell.fillCell(status: false, id: "#5065", master: "mastercard", person: "Hüseyin Akdeniz", statusS: "open", date: "26 Temmuz 2024, 14:50", check: "Ozan,Berat,Waiting For Zafer", product: "production",isLoading: isLoadingData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DeployDetailMainVC(nibName: "DeployDetailMainVC", bundle: nil)
        detailVC.setupTitleView()
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
