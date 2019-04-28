//
//  BasketPresenter.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

class BasketPresenter {
    private let currencyService: CurrencyService
//    private weak var view: IssueView?
//    private var firstLoad = true
    
    init(service: CurrencyService) {
        currencyService = service
    }
    
    func loadCurrencies() {
        currencyService.loadCurrencyRates { (currencyPairs, error) in
            print(currencyPairs)
        }
    }
    
//    func attach(view: IssueView) {
//        self.view = view
//    }
}
