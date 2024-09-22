//
//  DeployDetailMainVC.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 5.08.2024.
//

import UIKit

class DeployDetailMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        tableView.register(UINib(nibName: "DeployDetailMainVC", bundle: nil), forCellReuseIdentifier: "DeployDetailViewCellTable")
        
        tableView.register(UINib(nibName: "DeployDetailViewCellTable", bundle: nil), forCellReuseIdentifier: "DeployDetailViewCellTable")
        
        tableView.register(UINib(nibName: "PipelineTableCell", bundle: nil), forCellReuseIdentifier: "PipelineTableCell")
        
        tableView.register(UINib(nibName: "ChangeSetTableCell", bundle: nil), forCellReuseIdentifier: "ChangeSetTableCell")
        
        tableView.register(UINib(nibName: "ActionTableCell", bundle: nil), forCellReuseIdentifier: "ActionTableCell")
        
        tableView.register(UINib(nibName: "EnvironmentTableCell", bundle: nil), forCellReuseIdentifier: "EnvironmentTableCell")
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EnvironmentTableCell", for: indexPath) as! EnvironmentTableCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeployDetailViewCellTable", for: indexPath) as! DeployDetailViewCellTable
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PipelineTableCell", for: indexPath) as! PipelineTableCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionTableCell", for: indexPath) as! ActionTableCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSetTableCell", for: indexPath) as! ChangeSetTableCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }else if indexPath.section == 1 {
            return 470
        } else if indexPath.section == 2 {
            return 200
        } else if indexPath.section == 3 {
            return 100
        }
        else{
            return 200
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as? CustomHeaderView else {
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
        default:
            headerView.headerLabel.text = "CHANGE SET"
            headerView.imageView.image = UIImage(systemName: "list.bullet")
            
            
        }
        
        return headerView
    }
    
    func didTapImageView(in headerView: CustomHeaderView) {
        let detailVC = ChangeSetPopTable(nibName: "ChangeSetPopTable", bundle: nil)
        detailVC.setupTitleView()
        self.navigationController?.present(detailVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    
}
