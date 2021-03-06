//
//  BasketPresenter.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

protocol BasketView: class {
    func reloadData()
}

class BasketPresenter {
    var currencyPairModels = [CurrencyPairModel]()
    
    var selectedRow: Int? = nil
    
    var selectedItems: [ShopCellPresenter] {
        return shopItems.filter({ $0.amountDecimal > 0 })
    }
    
    var numberOfRows: Int {
        return selectedItems.count
    }
    
    var numberOfCollectionRows: Int {
        return currencyPairModels.count
    }
    
    var totalAmount: String {
        let sum = selectedItems.map({ $0.sumDecimal }).reduce(0,+)
        return "Total amount: " + (NumberFormatter.currencyFormatter.string(from: sum as NSDecimalNumber) ?? "") + " $"
    }
    
    var totalAmountDecimal: Decimal {
        return selectedItems.map({ $0.sumDecimal }).reduce(0,+)
    }
    
    private var shopItems = [ShopCellPresenter]()
    private let currencyService: CurrencyServiceProtocol
    private weak var basketView: BasketView?
    
    init(service: CurrencyServiceProtocol, shopItems: [ShopCellPresenter]) {
        currencyService = service
        self.shopItems = shopItems
    }
    
    func loadCurrencies(completion: (() -> ())? = nil) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.currencyService.loadCurrencyRates { (currencyPairs, error) in
                DispatchQueue.main.async {
                    guard let currencyPairs = currencyPairs, error == nil else { return }
                    self?.setupCurrencies(pairs: currencyPairs)
                    self?.basketView?.reloadData()
                    completion?()
                }
            }
        }
    }
    
    func calculateAmount(for currency: CurrencyPairModel) -> String {
        let sum = selectedItems.map({ $0.sumDecimal * currency.ratio }).reduce(0,+)
        return "Total amount: " + (NumberFormatter.currencyFormatter.string(from: sum as NSDecimalNumber) ?? "") + " " + currency.currencyName
    }
    
    func attach(view: BasketView) {
        self.basketView = view
    }
    
    private func setupCurrencies(pairs: CurrencyPairs) {
        for (key, val) in pairs.quotes {
            currencyPairModels.append(CurrencyPairModel(pairName: key, ratio: val))
        }
    }
}
