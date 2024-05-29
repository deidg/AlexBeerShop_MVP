//
//  BeersModel.swift
//  AlexBeerShop_MVP
//
//  Created by Alex on 27.04.2024.
//

import Foundation

struct BeersModel: Codable {
    let beers: [SingleBeer]
}

struct SingleBeer: Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL = "imageUrl"
    }
}
