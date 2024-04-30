//
//  BeersListVC.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit
import SnapKit
import Kingfisher


final class BeersListVC: UIViewController {
    //MARK: - Elements
    private let networkRequest = NetworkRequest()
    private let beersTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(BeerCell.self, forCellReuseIdentifier: "beerCell")
        tableView.rowHeight = UITableView.automaticDimension
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
//        setupUI()
        setupDelegates()
//        fetchBeersList()
    }
    
    private func setupVC() {
        view.backgroundColor = .blue
        title = "Beer list"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegates() {
        beersTableView.dataSource = self
        beersTableView.delegate = self
    }

}
