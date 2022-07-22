//
//  TabBarViewController.swift
//  toss
//
//  Created by 최모지 on 2022/07/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setTabBar()
    }
}

extension TabBarViewController {
    private func setTabBar(){
        
        let homeVC = HomeViewController()
        let totalVC = TotalViewController()
        
        homeVC.title = "home"
        totalVC.title = "total"
        
        setViewControllers([homeVC, totalVC], animated: false)
    }
}
