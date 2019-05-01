//
//  NumberFormatter+Extension.swift
//  testBasket
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        currencyFormatter.locale = Locale.current
        return currencyFormatter
    }
}
