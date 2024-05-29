//
//  RandomVCPresenter.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 30.04.2024.
//

import Foundation

protocol RandomVCSetupProtocol {
    init(view: RandomBeerView)
    
    func fetchRandomBeer()
}

final class RandomVCPresenter {
    private weak var view: RandomBeerView?
    
    let networkingApi: NetworkService!
    
    required init(view: RandomBeerView) {
        self.view = view
        self.networkingApi = NetworkRequest()
    }
    
    func fetchRandomBeer() {
        networkingApi.getRandomBeer() { [weak self] beer in
            guard let self = self else {return}
            if let beer = beer {
                view?.randomBeerReset(beer: beer)
            }
        }
    }
}
