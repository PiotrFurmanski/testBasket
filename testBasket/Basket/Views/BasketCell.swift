//
//  BasketCell.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    var presenter: ShopCellPresenter?
    
    func setup(presenter: ShopCellPresenter) {
        name.text = presenter.name
        price.text = presenter.sum
        quantity.text = presenter.amount
    }

}
