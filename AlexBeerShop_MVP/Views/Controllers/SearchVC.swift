//
//  SearchVC.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol SearchByIdView: AnyObject {
    func oneBeerOnReset(beer: SingleBeer)
}

final class SearchVC: UIViewController {
    // MARK: - Elements
    var presenterSearchVC: SearchVCPresenter!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let beerViewTemplate = DetailBeerView()
    private let onboardLabel: UILabel = {
        let onboardLabel = UILabel()
        onboardLabel.text = "Enter beer ID (from 1 to 25)"
        return onboardLabel
    }()
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupVC()
        setupViewTemplate()
        setupInboardLabel()
        setupSearchContoller()
    }
    // MARK: - Private methods
    private func setupNavigationTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Search by ID"
    }
    
    private func setupVC() {
        view.backgroundColor = .white
    }
    
    private func setupViewTemplate() {
        view.addSubview(beerViewTemplate)
        beerViewTemplate.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupInboardLabel() {
        view.addSubview(onboardLabel)
        onboardLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    private func setupSearchContoller() {
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.keyboardType = .numberPad
    }
}
// MARK: - UISearchResultsUpdating
extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputId = Int(searchController.searchBar.text ?? "") else { return }
        if inputId > 0 && inputId < 26 {
            presenterSearchVC.searchById(inputId: inputId)
            beerViewTemplate.isHidden = false
            onboardLabel.isHidden = true
        } else {
            beerViewTemplate.isHidden = true
            onboardLabel.isHidden = false
            onboardLabel.text = "Beer ID should be from 1 to 25"
            onboardLabel.textColor = .red
        }
    }
}
// MARK: - SearchByIdView
extension SearchVC: SearchByIdView {
    func oneBeerOnReset(beer: SingleBeer) {
        beerViewTemplate.configureView(singleBeer: beer)
    }
}
