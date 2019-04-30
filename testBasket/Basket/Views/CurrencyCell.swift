//
//  CurrencyCell.swift
//  testBasket
//
//  Created by Piotr Furmanski on 01/05/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var highlightView: UIView!
    
    func setup(with currency: CurrencyPairModel?) {
        currencyName.text = currency?.currencyName
        highlightView.isHidden = true
    }
    
    override var isSelected: Bool {
        didSet {
            highlightView.isHidden = !isSelected
        }
    }
}
