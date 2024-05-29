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
        generateTabs()
    }
    
    private func generateTabs() {
        let beerListVC = BeersListVC()
        let beerPresenter = BeerListPresenter(view: beerListVC)
        beerListVC.presenter = beerPresenter
        beerListVC.tabBarItem = UITabBarItem(title: "Beers List", image: UIImage(systemName: "1.circle"), tag: 0)
        let beerListNavigationVC = UINavigationController(rootViewController: beerListVC)
        
        let searchVC = SearchVC()
        let searchVCPresenter = SearchVCPresenter(view: searchVC)
        searchVC.presenterSearchVC = searchVCPresenter
        searchVC.tabBarItem = UITabBarItem(title: "Search by ID", image: UIImage(systemName: "2.circle"), tag: 0)
        let searchByIDNavigationVC = UINavigationController(rootViewController: searchVC)
        
        let randomBeerVC = RandomBeerVC()
        let randomVCPresenter = RandomVCPresenter(view: randomBeerVC)
        randomBeerVC.randomVCPresenter = randomVCPresenter
        randomBeerVC.tabBarItem = UITabBarItem(title: "Random beer", image: UIImage(systemName: "3.circle"), tag: 0)
        let randomBeerNavigationVC = UINavigationController(rootViewController: randomBeerVC)
        
        viewControllers = [beerListNavigationVC, searchByIDNavigationVC, randomBeerNavigationVC]
    }
}

