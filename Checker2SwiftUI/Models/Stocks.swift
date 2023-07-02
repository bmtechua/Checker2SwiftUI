//
//  Stocks.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 24.04.2023.
//

import Foundation

struct Stocks: Codable {
    var stock: [Stock]
    var as_of: String
}

class Stock: Codable, Identifiable {
    var name: String
    var price: Price
    var percent_change: Double
    var volume: Int
    var symbol: String
}

class Price: Codable {
    var currency: String
    var amount: Double
}
