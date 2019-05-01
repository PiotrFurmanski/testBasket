//
//  CurrencyServiceMock.swift
//  testBasketTests
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation
@testable import testBasket

class CurrencyServiceMock: CurrencyServiceProtocol {
    func loadCurrencyRates(completion: @escaping (CurrencyPairs?, Error?) -> ()) {
        let currencyPairs = CurrencyPairs(source: "USD", quotes: ["USDEUR" : Decimal(string: "0.88")!,
                                                                  "USDGBP" : Decimal(string: "0.76")!,
                                                                  "USDPLN" : Decimal(string: "3.81")!])
        completion(currencyPairs, nil)
    }

}
