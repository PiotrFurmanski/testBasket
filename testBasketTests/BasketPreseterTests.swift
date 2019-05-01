//
//  testBasketTests.swift
//  testBasketTests
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import XCTest
@testable import testBasket

enum CustomError: Error {
    case runtimeError(String)
}

class BasketPreseterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldSetThreeCurrencyPairs() {
        
        let expect = expectation(description: "Waiting response")
        let basketView = BasketViewMock()
        let basketPresenterUnderTest = BasketPresenter(service: CurrencyServiceMock(), shopItems: [ShopCellPresenter]())
        basketPresenterUnderTest.attach(view: basketView)
        
        basketPresenterUnderTest.loadCurrencies() {
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(basketView.dataReloaded)
        XCTAssertEqual(basketPresenterUnderTest.numberOfCollectionRows, 3)
    }
    
    func testShouldSetProperlySelectedItems() {
        let shopItems = [ShopCellPresenter(item: ShopItem(price: 1000.0, name: "Tv", quantity: "", amount: 1)),
                         ShopCellPresenter(item: ShopItem(price: 500.0, name: "Ipone", quantity: "", amount: 0)),
                         ShopCellPresenter(item: ShopItem(price: 499.0, name: "PS5", quantity: "", amount: 2))]
        let basketPresenterUnderTest = BasketPresenter(service: CurrencyServiceMock(), shopItems: shopItems)
        
        XCTAssertEqual(basketPresenterUnderTest.numberOfRows, 2)
        XCTAssertEqual(basketPresenterUnderTest.totalAmount, "Total amount: 1,998.00 $")
    }
    
    func testShouldProperlyCalculateCurrencyPair() {
        let shopItems = [ShopCellPresenter(item: ShopItem(price: 1000.0, name: "Tv", quantity: "", amount: 1)),
                         ShopCellPresenter(item: ShopItem(price: 500.0, name: "Ipone", quantity: "", amount: 0)),
                         ShopCellPresenter(item: ShopItem(price: 499.0, name: "PS5", quantity: "", amount: 2))]
        let basketPresenterUnderTest = BasketPresenter(service: CurrencyServiceMock(), shopItems: shopItems)
        
        XCTAssertEqual(basketPresenterUnderTest.numberOfRows, 2)
        XCTAssertEqual(basketPresenterUnderTest.totalAmount, "Total amount: 1,998.00 $")
        let currencyPair = CurrencyPairModel(pairName: "USDGBP", ratio: Decimal(string: "0.76")!)
        XCTAssertEqual(basketPresenterUnderTest.calculateAmount(for: currencyPair), "Total amount: 1,518.48 GBP")
    }
    
}

