//
//  BeerListPresenter.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 27.04.2024.
//

import Foundation

protocol BeerListViewPresenter {
    init(view: BeerListView)
    func onViewDidLoad()
}

final class BeerListPresenter: BeerListViewPresenter  {
    private weak var view: BeerListView?
    
    let networkingApi: NetworkService!
    
    func onViewDidLoad() {
        networkingApi.getBeerList() { [weak self] beers in
            guard let self = self else {return}
            view?.onItemsReset(beers: beers)
        }
    }
    
    required init(view: BeerListView) {
        self.view = view
        self.networkingApi = NetworkRequest()
    }
}


