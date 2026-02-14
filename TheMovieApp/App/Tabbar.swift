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
        let home = HomeController(viewModel: .init(useCase: HomeManager()))
        let homeNavigation = UINavigationController(rootViewController: home)
        homeNavigation.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let actor = ActorController(viewModel: .init(useCase: ActorManager(manager: CoreManager())))
        let actorNav = UINavigationController(rootViewController: actor)
        actorNav.tabBarItem = .init(title: "actor", image: UIImage(systemName: "person.fill"), tag: 1)
        
        
        
        viewControllers = [homeNavigation,actorNav]
    }
    
    private func configureUI() {
        
    }
}
