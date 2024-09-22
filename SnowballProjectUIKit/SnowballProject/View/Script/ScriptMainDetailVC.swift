//
//  ScriptMainDetailVC.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 12.08.2024.
//

import UIKit

class ScriptMainDetailVC : UIViewController, UITableViewDelegate, UITableViewDataSource, ScriptCustomHeaderViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.accessibilityIdentifier = "ScriptMainDetailVC"
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ScriptCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "ScriptCustomHeaderView")
        
        tableView.register(UINib(nibName: "ScriptMainDetailVC", bundle: nil), forCellReuseIdentifier: "ScriptMainDetailVC")
        
        tableView.register(UINib(nibName: "ScriptDetailViewCellTable", bundle: nil), forCellReuseIdentifier: "ScriptDetailViewCellTable")
        
        tableView.register(UINib(nibName: "ScriptPipelineTableCell", bundle: nil), forCellReuseIdentifier: "ScriptPipelineTableCell")
        
        tableView.register(UINib(nibName: "ScriptChangeSetTableCell", bundle: nil), forCellReuseIdentifier: "ScriptChangeSetTableCell")
        
        tableView.register(UINib(nibName: "ScriptFilesCellTable", bundle: nil), forCellReuseIdentifier: "ScriptFilesCellTable")
        
        tableView.register(UINib(nibName: "ScriptEnvironmentTableCell", bundle: nil), forCellReuseIdentifier: "ScriptEnvironmentTableCell")
        
        tableView.register(UINib(nibName: "ScriptActionTableCell", bundle: nil), forCellReuseIdentifier: "ScriptActionTableCell")
        
        tableView.register(UINib(nibName: "FilesConfirmationTableCell", bundle: nil), forCellReuseIdentifier: "FilesConfirmationTableCell")
        
        
        
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptEnvironmentTableCell", for: indexPath) as! ScriptEnvironmentTableCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptDetailViewCellTable", for: indexPath) as! ScriptDetailViewCellTable
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptPipelineTableCell", for: indexPath) as! ScriptPipelineTableCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptActionTableCell", for: indexPath) as! ScriptActionTableCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptFilesCellTable", for: indexPath) as! ScriptFilesCellTable
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptChangeSetTableCell", for: indexPath) as! ScriptChangeSetTableCell
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }else if indexPath.section == 1 {
            return 470
        } else if indexPath.section == 2 {
            return 170
        } else if indexPath.section == 3 {
            return 100
        }
        else if indexPath.section == 4{
            return 150
        } else {
            return 170
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ScriptCustomHeaderView") as? ScriptCustomHeaderView else {
            return nil
        }
        
        headerView.delegate = self
        switch section {
        case 0:
            headerView.headerLabel.text = "ENVIRONMENT"
        case 1:
            headerView.headerLabel.text = "DETAIL"
        case 2:
            headerView.headerLabel.text = "PIPELINE"
        case 3:
            headerView.headerLabel.text = "ACTION"
        case 4:
            headerView.headerLabel.text = "FILES"
            
        default:
            
            headerView.headerLabel.text = "CHANGE SET"
            headerView.imageView.image = UIImage(systemName: "list.bullet")
            
        }
        
        return headerView
    }
    
    func didTapImageView(in headerView: ScriptCustomHeaderView) {
        let detailVC = ScriptChangeSetPopTable(nibName: "ScriptChangeSetPopTable", bundle: nil)
        detailVC.setupTitleView()
        self.navigationController?.present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parentViewController = self.parent {
               let detailViewController = FilesConfirmationTableCell()
               if let navigationController = parentViewController.navigationController {
                   navigationController.pushViewController(detailViewController, animated: true)
               } else {
                   print("Navigation controller mevcut değil, sayfa yönlendirme yapılamıyor.")
               }
           }
       }
}
