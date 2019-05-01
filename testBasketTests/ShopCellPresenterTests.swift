//
//  ShopCellPresenterTests.swift
//  testBasketTests
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import XCTest
@testable import testBasket

class ShopCellPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldCalculateAmountProperly() {
        let shopCellPresenterUnderTest = ShopCellPresenter(item: ShopItem(price: Decimal(string: "1.1")!,
                                                                          name: "Chocolate",
                                                                          quantity: "bar", amount: 2))

        
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "2")
        shopCellPresenterUnderTest.subtractProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "1")
        shopCellPresenterUnderTest.subtractProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "0")
        shopCellPresenterUnderTest.subtractProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "0")
        shopCellPresenterUnderTest.addProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "1")
        shopCellPresenterUnderTest.addProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "2")
        
        XCTAssertEqual(shopCellPresenterUnderTest.sum, "2.20 $")
        
    }
    
    func testShouldCalculateAmountProperlyForMax() {
        let shopCellPresenterUnderTest = ShopCellPresenter(item: ShopItem(price: Decimal(string: "1.1")!,
                                                                          name: "Chocolate",
                                                                          quantity: "bar", amount: 9998))
        
        
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "9998")
        shopCellPresenterUnderTest.addProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "9999")
        shopCellPresenterUnderTest.addProduct()
        XCTAssertEqual(shopCellPresenterUnderTest.amount, "9999")
        
        XCTAssertEqual(shopCellPresenterUnderTest.sum, "10,998.90 $")
        
    }
    
}
