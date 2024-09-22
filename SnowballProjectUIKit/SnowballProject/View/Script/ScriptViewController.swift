//
//  ScriptViewController.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 26.07.2024.
//

import UIKit


class ScriptViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var isLoadingData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ScriptTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ScriptTableCell")
        tableView.reloadData()
        loadData()
        
        self.view.accessibilityIdentifier = "ScriptVC"
    
    }

    func loadData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoadingData = false
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptTableCell", for: indexPath) as! ScriptTableCell
        cell.fillCell(status: false, id: "#5065", master: "mastercard", person: "Hüseyin Akdeniz", statusS: "open", date: "26 Temmuz 2024, 14:50", check: "Ozan,Berat,Waiting For Zafer", product: "production", isLoading: isLoadingData)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = ScriptMainDetailVC(nibName: "ScriptMainDetailVC", bundle: nil)
        detailVC.setupTitleView()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}




