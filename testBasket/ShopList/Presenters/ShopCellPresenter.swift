//
//  ShopCellPresenter.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

class ShopCellPresenter {
    
    var name: String {
        return shopItem.name
    }
    var price: String {
        return shopItem.price.description + " $"
    }
    var quantity: String {
        return shopItem.quantity
    }
    var amount: String {
        return shopItem.amount.description
    }
    
    var amountDecimal: Decimal {
        return shopItem.amount
    }
    
    var sum: String {
        return (NumberFormatter.currencyFormatter.string(from: sumDecimal as NSDecimalNumber) ?? "") + " $"
    }
    
    var sumDecimal: Decimal {
        return shopItem.amount * shopItem.price
    }
    
    private var shopItem: ShopItem
    
    init(item: ShopItem) {
        shopItem = item
    }
    
    func subtractProduct() -> String {
        guard shopItem.amount > 0 else { return shopItem.amount.description }
        shopItem.amount -= 1
        return shopItem.amount.description
    }
    
    func addProduct() -> String {
        shopItem.amount += 1
        return shopItem.amount.description
    }
    
    func clearAmount() -> String {
        shopItem.amount = Decimal(floatLiteral: 0)
        return shopItem.amount.description
    }
    
    func update(amount: Decimal) {
        shopItem.amount = amount
    }
}
