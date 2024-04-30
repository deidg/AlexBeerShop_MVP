//
//  SearchVC.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class SearchVC: UIViewController {
    //MARK: - Elements
    private let networkRequest = NetworkRequest()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
//        setupUI()
//        fetchBeersList()
    }
    
    private func setupVC() {
        view.backgroundColor = .blue
        title = "Beer list"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
