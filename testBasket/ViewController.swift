//
//  ViewController.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let presenter = BasketPresenter(service: CurrencyService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickButton() {
        presenter.loadCurrencies()
    }


}

