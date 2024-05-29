//
//  RandomBeerVC.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol RandomBeerView: AnyObject {
    func randomBeerReset(beer: SingleBeer)
}

final class RandomBeerVC: UIViewController {
    // MARK: - Elements
    var randomVCPresenter: RandomVCPresenter!
    
    private let beerViewTemplate = DetailBeerView()
    private let randomButton: UIButton = {
        let randomButton = UIButton()
        randomButton.backgroundColor = .orange
        randomButton.setTitle("Random beer search", for: .normal)
        randomButton.isEnabled = true
        return randomButton
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupUI()
        addtargets()
    }
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    // MARK: - Private methods
    private func setupVC() {
        view.backgroundColor = .white
        title = "Random beer"
    }
    
    private func setupUI() {
        view.addSubview(beerViewTemplate)
        beerViewTemplate.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        view.addSubview(randomButton)
        randomButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view).inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(30)
        }
    }
    
    private func addtargets() {
        randomButton.addTarget(self, action: #selector(getRandomBeer), for: .touchUpInside)
    }
    // MARK: - @objc method
    @objc private func getRandomBeer() {
        randomVCPresenter.fetchRandomBeer()
    }
}
// MARK: - RandomBeerView
extension RandomBeerVC: RandomBeerView {
    func randomBeerReset(beer: SingleBeer) {
        beerViewTemplate.configureView(singleBeer: beer)
    }
}
