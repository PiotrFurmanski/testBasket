//
//  CurrencyPair.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

struct CurrencyPairs: Codable {
    var source: String
    var quotes: [String:Decimal]
}
