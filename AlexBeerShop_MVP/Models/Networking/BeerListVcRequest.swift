//
//  NetworkRequest.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import Foundation

protocol NetworkService {
    func getBeerList(from fileName: String, completion: (([SingleBeer]) -> Void)?)

}

class NetworkRequest: NetworkService {
    func getBeerList(from fileName: String, completion: (([SingleBeer]) -> Void)?) {
        if let sourceUrl = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion?(jsonData.beers)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
 
    
    
}
