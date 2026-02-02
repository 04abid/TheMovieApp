//
//  Tabbar.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 31.01.26.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        configureUI()
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        let home = HomeController()
        let homeNavigation = UINavigationController(rootViewController: home)
        homeNavigation.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        viewControllers = [homeNavigation]
    }
    
    private func configureUI() {
        
    }
}
