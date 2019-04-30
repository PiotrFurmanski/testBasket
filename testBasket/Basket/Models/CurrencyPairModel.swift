//
//  CurrencyPairModel.swift
//  testBasket
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

struct CurrencyPairModel {
    var pairName: String
    var ratio: Decimal
    
    var currencyName: String {
        return String(pairName.dropFirst(3))
    }
}
