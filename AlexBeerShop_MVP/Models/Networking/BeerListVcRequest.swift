//
//  BeerListVcRequest.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 26.04.2024.
//

import Foundation

protocol NetworkService {
    func getBeerList(completion: (([SingleBeer]) -> Void)?)
    func searchBeerByID(id: Int, completion: @escaping (SingleBeer?) -> Void?)
    func getRandomBeer(completion: @escaping (SingleBeer?) -> Void?)
}

class NetworkRequest: NetworkService {
    func getBeerList(completion: (([SingleBeer]) -> Void)?){
        if let sourceUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: "json") {
            do {
                let data = try Data(contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion?(jsonData.beers)
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
    
    func searchBeerByID(id: Int, completion: @escaping (SingleBeer?) -> Void?) {
        if let sourcesuUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: "json") {
            do {
                let data = try Data(contentsOf: sourcesuUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion(jsonData.beers[id-1])
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
    
    func getRandomBeer(completion: @escaping (SingleBeer?) -> Void?) {
        let randomInt = Int.random(in: 0..<25)
        if let sourceUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: "json") {
            do {
                let data = try Data(contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion(jsonData.beers[randomInt])
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
}
