//
//  Order.swift
//  CupcakeCorner
//
//  Created by Игорь Верхов on 09.09.2023.
//

import SwiftUI

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestsEnabled = "specialRequestsEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name: String {
        didSet {
            UserDefaults.standard.setValue(name, forKey: "name")
        }
    }
    var streetAddress: String {
        didSet {
            UserDefaults.standard.setValue(streetAddress, forKey: "streetAdress")
        }
    }
    var city: String {
        didSet {
            UserDefaults.standard.setValue(city, forKey: "city")
        }
    }
    var zip: String {
        didSet {
            UserDefaults.standard.setValue(zip, forKey: "zip")
        }
    }
    
    var hasValidAdress: Bool {
        name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty ? false : true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
        self.streetAddress = UserDefaults.standard.string(forKey: "streetAdress") ?? ""
        self.city = UserDefaults.standard.string(forKey: "city") ?? ""
        self.zip = UserDefaults.standard.string(forKey: "zip") ?? ""
    }
}
