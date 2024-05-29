//
//  SearchVCPresenter.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 30.04.2024.
//

import Foundation

protocol SearchPresenter {
    init(view: SearchByIdView)
    func searchById(inputId: Int)
}

final class SearchVCPresenter: SearchPresenter {
    
    private weak var view: SearchByIdView?
    
    let networkingApi: NetworkService!
    
    func searchById(inputId: Int) {
        networkingApi.searchBeerByID(id: inputId) { [weak self] beer in
            guard let self = self,
                  let beer = beer else {return}
            view?.oneBeerOnReset(beer: beer)
        }
    }
    
    required init(view: SearchByIdView) {
        self.view = view
        self.networkingApi = NetworkRequest()
    }
}

