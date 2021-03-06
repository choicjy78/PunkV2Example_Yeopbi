//
//  PunkV2Data.swift
//  PunkV2_Example
//
//  Created by Jinyeop Choi on 2018. 12. 28..
//

import Foundation
import SwiftyJSON

enum Unit {
    case liters
    case celsius
    case kilograms
    case grams
    case etc
}

struct Beer {
    var id: Int
    var name: String
    var tagline: String
    var firstBrewed: BeerBrewedDate
    var description: String
    var imageURL: String
    var abv: Float
    var ibu: Float
    var targetFG: Float
    var targetOG: Float
    var ebc: Float
    var srm: Float
    var ph: Float
    var attenuationLevel: Float
    var volume: BeerValueUnit
    var boilVolume: BeerValueUnit
    var method: BeerMethod
    var ingredients: BeerIngredients
    var foodPairing: [String]
    var brewersTips: String
    var contributedBy: String
    
    init(data: JSON) {
        let foodPairingArray = data["food_pairing"].arrayValue
        
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.tagline = data["tagline"].stringValue
        self.firstBrewed = BeerBrewedDate(data: data["first_brewed"].stringValue)
        self.description = data["description"].stringValue
        self.imageURL = data["image_url"].stringValue
        self.abv = data["abv"].floatValue
        self.ibu = data["ibu"].floatValue
        self.targetFG = data["target_fg"].floatValue
        self.targetOG = data["target_og"].floatValue
        self.ebc = data["ebc"].floatValue
        self.srm = data["srm"].floatValue
        self.ph = data["ph"].floatValue
        self.attenuationLevel = data["attenuation_level"].floatValue
        self.volume = BeerValueUnit(data: data["volume"])
        self.boilVolume = BeerValueUnit(data: data["boil_volume"])
        self.method = BeerMethod(data: data["method"])
        self.ingredients = BeerIngredients(data: data["ingredients"])
        self.foodPairing = foodPairingArray.map { $0.stringValue }
        self.brewersTips = data["brewers_tips"].stringValue
        self.contributedBy = data["contributed_by"].stringValue
    }
}

struct BeerMethod {
    var mashTemp: [BeerMeshTemp]
    var fermentationTemp: BeerValueUnit
    var twist: String
    
    init(data: JSON) {
        let mashTempArray = data["mash_temp"].arrayValue
        
        self.mashTemp = mashTempArray.map { BeerMeshTemp(data: $0) }
        self.fermentationTemp = BeerValueUnit(data: data["fermentation"]["temp"])
        self.twist = data["twist"].stringValue
    }
}

struct BeerIngredients {
    var malt: [BeerMalt]
    var hops: [BeerHops]
    var yeast: String
    
    init(data: JSON) {
        let maltArray = data["malt"].arrayValue
        let hopsArray = data["hops"].arrayValue
        
        self.malt = maltArray.map { BeerMalt(data: $0) }
        self.hops = hopsArray.map { BeerHops(data: $0) }
        self.yeast = data["yeast"].stringValue
    }
}

struct BeerMeshTemp {
    var temp: BeerValueUnit
    var duration: Int
    
    init(data: JSON) {
        self.temp = BeerValueUnit(data: data["temp"])
        self.duration = data["duration"].intValue
    }
}

struct BeerValueUnit {
    var value: Float
    var unit: Unit
    
    init(data: JSON) {
        self.value = data["value"].floatValue

        switch data["unit"].stringValue {
        case "liters":
            self.unit = .liters
        case "celsius":
            self.unit = .celsius
        case "kilograms":
            self.unit = .kilograms
        case "grams":
            self.unit = .grams
        default:
            self.unit = .etc
        }
    }
}

struct BeerMalt {
    var name: String
    var amount: BeerValueUnit
    
    init(data: JSON) {
        self.name = data["name"].stringValue
        self.amount = BeerValueUnit(data: data["amount"])
    }
}

struct BeerHops {
    var name: String
    var amount: BeerValueUnit
    var add: String
    var attribute: String
    
    init(data: JSON) {
        self.name = data["name"].stringValue
        self.amount = BeerValueUnit(data: data["amount"])
        self.add = data["add"].stringValue
        self.attribute = data["attribute"].stringValue
    }
}

struct BeerBrewedDate {
    var year: String
    var month: String
    
    init(data: String) {
        let seperatedBySlash = data.components(separatedBy: "/")
        
        if seperatedBySlash.count == 2 {
            self.month = seperatedBySlash[0]
            self.year = seperatedBySlash[1]
        } else {
            self.year = ""
            self.month = ""
        }
    }
}
