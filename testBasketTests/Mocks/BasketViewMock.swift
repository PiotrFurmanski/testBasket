//
//  BasketViewMock.swift
//  testBasketTests
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation
@testable import testBasket

class BasketViewMock: BasketView {
    var dataReloaded = false
    func reloadData() {
        dataReloaded = true
    }
}
