//
//  BasketPresenter.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation


protocol ShopView: class {
    func reloadData()
}


class ShopPresenter {
    var shopItems = [ShopCellPresenter]()
    
    var numberOfRows: Int {
        return shopItems.count
    }
    
    private weak var shopView: ShopView?
    
    func setupData() {
        shopItems.append(ShopCellPresenter(item: ShopItem(price: 0.95, name: "Peas", quantity: "bag", amount: 0)))
        shopItems.append(ShopCellPresenter(item: ShopItem(price: 2.1, name: "Eggs", quantity: "dozen", amount: 0)))
        shopItems.append(ShopCellPresenter(item: ShopItem(price: 1.3, name: "Milk", quantity: "bottle", amount: 0)))
        shopItems.append(ShopCellPresenter(item: ShopItem(price: 0.73, name: "Beans", quantity: "can", amount: 0)))
    }
    
    func attach(view: ShopView) {
        self.shopView = view
    }
}
