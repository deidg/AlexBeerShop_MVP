//
//  TabBarController.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func generateTabs() {
        let beersListVC = UINavigationController(rootViewController: BeersListVC())
        let searchVC = UINavigationController(rootViewController: SearchVC())
        let randomBeerVC = UINavigationController(rootViewController: RandomVC())
        beersListVC.tabBarItem = UITabBarItem(title: "Beers List", image: UIImage(systemName: "1.circle"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search ID", image: UIImage(systemName: "2.circle"), tag: 0)
        randomBeerVC.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "3.circle"), tag: 0)
        viewControllers = [beersListVC, searchVC, randomBeerVC]
    }


}

