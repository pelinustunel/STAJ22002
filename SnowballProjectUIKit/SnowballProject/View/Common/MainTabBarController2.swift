//
//  MainTabBarController2.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 28.07.2024.
//

import UIKit

class MainTabBarController2: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let approvementVC = ApprovementsViewController()
        let scriptVC = ScriptViewController()
        let logVC = LogViewController()
        let deployVC = DeployViewController()
        
        
        approvementVC.tabBarItem = UITabBarItem(title: "Waiting", image: UIImage(systemName: "house.fill"), tag: 0)
        scriptVC.tabBarItem = UITabBarItem(title: "Script", image: UIImage(systemName: "doc.fill"), tag: 1)
        logVC.tabBarItem = UITabBarItem(title: "Log", image: UIImage(systemName: "circle.fill"), tag: 2)
        deployVC.tabBarItem = UITabBarItem(title: "Deploy", image: UIImage(systemName: "paperplane.fill"), tag: 3)
        
        // navigationController da tabbar kök viewcontrroler olarak ayarlama
        self.viewControllers = [approvementVC, scriptVC, logVC, deployVC].map {
            let navigationController = UINavigationController(rootViewController: $0)
            
            //Call ClearCacheService
            
            $0.setupTitleView()
            return navigationController
        }
        
        tabBar.barTintColor = .black
        tabBar.tintColor = UIColor(hex: "#5CCAED")
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Detay sayfasına geçerken tabbar hide olmasını engelleme
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
