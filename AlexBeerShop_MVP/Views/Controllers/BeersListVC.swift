//
//  BeersListVC.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol BeerListView: AnyObject {
    func onItemsReset(beers: [SingleBeer])
}

final class BeersListVC: UIViewController {
    //MARK: - Elements
    var presenter: BeerListViewPresenter!
    
    private var beersList = [SingleBeer]()
    
    private let beersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BeerCell.self, forCellReuseIdentifier: "beerCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupUI()
        setupDelegates()
        presenter.onViewDidLoad()
    }
    
    private func setupVC() {
        view.backgroundColor = .white
        title = "Beer list"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegates() {
        beersTableView.dataSource = self
        beersTableView.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(beersTableView)
        beersTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func presentDetailVC(for beer: SingleBeer) {
        let detailVC = DetailVC(beer: beer)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    // MARK: - @objc methods
    @objc private func dismissDetailVC() {
        dismiss(animated: true)
    }
}
//MARK: - UITableViewDataSource, UITableViewDelegate
extension BeersListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as? BeerCell else {
            return UITableViewCell()
        }
        cell.setupView(model: beersList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beersList[indexPath.row]
        presentDetailVC(for: selectedBeer)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - BeerListView
extension BeersListVC: BeerListView {
    func onItemsReset(beers: [SingleBeer]) {
        self.beersList = beers
        DispatchQueue.main.async {
            self.beersTableView.reloadData()
        }
    }
}

