//
//  CardViewModel.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import SwiftUI

struct CardBundle: Identifiable, Hashable {
    var id = UUID().uuidString
    var nameAd: String
    var priceAd: String
    var isLike: Bool = false
    var description: String
    var firstPhotoAd: String
    var photoAd: [CardPhotos]
    var datePublicationAd: String
    var countViewsAd: String
    var likeCountsAd: String
    var likedAd: Bool
    var cityAd: String
}

struct CardPhotos: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

class CardViewModel: ObservableObject {
    
    func randomInRange(range: ClosedRange<Int>) -> Int {
           return Int.random(in: range)
    }
    let months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]

    let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            return formatter
    }()
    
    @Published var cardsAd : [CardBundle] = [
        CardBundle(nameAd: "Land Cruiser Prado", priceAd: "33 040 000", description: "2018 г. / U/C SUV 4.6 л / petrol / КПП automatic / white / metallic / Excalibur", firstPhotoAd: "toyota", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "12 August", countViewsAd: "32423", likeCountsAd: "15", likedAd: false, cityAd: "Almaty"),
        
        CardBundle(nameAd: "Land Rover Range Rover", priceAd: "119 000 000", description: "2023 г. / U/C SUV 3 л / petrol / КПП automatic / black / metallic", firstPhotoAd: "rangeRover", photoAd: [
            CardPhotos(imageURL: "rangeRover1"),
            CardPhotos(imageURL: "rangeRover2"),
            CardPhotos(imageURL: "rangeRover3"),
            CardPhotos(imageURL: "rangeRover4"),
            CardPhotos(imageURL: "rangeRover5"),
            CardPhotos(imageURL: "rangeRover6"),
        ], datePublicationAd: "15 July", countViewsAd: "23423", likeCountsAd: "13", likedAd: false, cityAd: "Aktobe"),
        
        CardBundle(nameAd: "Audi A8", priceAd: "8 800 000", description: "2011 г. / U/S Sedan 4.6 л / petrol / КПП automatic / white / metallic / 12 600 km", firstPhotoAd: "audi", photoAd: [
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "23 July", countViewsAd: "324234", likeCountsAd: "19", likedAd: false, cityAd: "Uralsk"),
        
        CardBundle(nameAd: "Toyota RAV 4", priceAd: "12 600 000", description: "2015 г. / U/S SUV 2 л / petrol / КПП automatic / black / metallic / 98 000 km", firstPhotoAd: "toyotoRav1", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "19 May", countViewsAd: "12323", likeCountsAd: "23", likedAd: false, cityAd: "Uralsk"),
        
        
        CardBundle(nameAd: "Jetour X70 Plus", priceAd: "10 900 000", description: "2021 г. / Б/v SUV 1.5 л / petrol / КПП automatic / black / metallic / 38 000 km", firstPhotoAd: "jetour", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "18 June", countViewsAd: "12323", likeCountsAd: "12", likedAd: false, cityAd: "Almaty"),
        
        
        CardBundle(nameAd: "Hyundai Creta", priceAd: "13 700 000", description: "2022 г. / Б/v SUV 2 л / petrol / КПП automatic / purple / metallic / 8 9000 km", firstPhotoAd: "hyundai", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "24 June", countViewsAd: "13223", likeCountsAd: "7", likedAd: false, cityAd: "Uralsk"),
        
        
        CardBundle(nameAd: "Lexus RX 300", priceAd: "29 300 000", description: "2019 г. / Б/v SUV 2 л / petrol / КПП automatic / blue / metallic / 24 800 km", firstPhotoAd: "lexus", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "28 May", countViewsAd: "1233", likeCountsAd: "4", likedAd: false, cityAd: "Almaty"),
        
        CardBundle(nameAd: "Toyota Land Cruiser Prado", priceAd: "28 000 000", description: "2018 г. / Б/v SUV 4 л / petrol / КПП automatic / black / metallic / 125 000 km", firstPhotoAd: "toyotoPrado", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "20 June", countViewsAd: "12332", likeCountsAd: "3", likedAd: false, cityAd: "Aktobe"),
        
        CardBundle(nameAd: "Volkswagen Golf", priceAd: "1 800 000", description: "1995 г. / Б/v Sedan 1.8 л / petrol / КПП automatic / green ", firstPhotoAd: "volkswagen", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "14 June", countViewsAd: "2323", likeCountsAd: "12", likedAd: false, cityAd: "Uralsk"),
        
        CardBundle(nameAd: "Mercedes-Benz E 400", priceAd: "22 500 000", description: "2017 г. / Б/v Sedan 3 л / petrol / КПП automatic / white / metallic / 62 000 km", firstPhotoAd: "mercedes", photoAd: [
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
            CardPhotos(imageURL: "toyota"),
        ], datePublicationAd: "14 May", countViewsAd: "23423", likeCountsAd: "23", likedAd: false, cityAd: "Astana")
        ]
}
