//
//  CardViewModel.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import Foundation

class CardViewModel: ObservableObject {
    
    public let name: String
    public let description: String
    public let price: String
    public let dateAd: String
    public let countViews: String
    public let countFavorite: String
    public let city: String
    public let image: String
    
    public init(name: String,
                description: String,
                price: String,
                dateAd: String,
                countViews: String,
                countFavorite: String,
                city: String,
                image: String) {
        self.name = name
        self.description = description
        self.price = price
        self.dateAd = dateAd
        self.countViews = countViews
        self.countFavorite = countFavorite
        self.city = city
        self.image = image
    }
}
