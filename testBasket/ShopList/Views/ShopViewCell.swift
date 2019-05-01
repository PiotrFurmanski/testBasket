//
//  ShopViewCell.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class ShopViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var amountTextField: UITextField! {
        didSet {
            amountTextField?.addDoneCancelToolbar(onDone: (target: self, action: #selector(doneButtonTapped)),
                                         onCancel: (target: self, action: #selector(cancelButtonTapped)))
        }
    }
    
    var presenter: ShopCellPresenter?
    
    func setup(presenter: ShopCellPresenter) {
        self.presenter = presenter
        name.text = presenter.name
        price.text = presenter.price
        quantity.text = presenter.quantity
        amountTextField.text = presenter.amount
        amountTextField.delegate = self
    }
    
    @IBAction func subtractProduct(_ sender: Any) {
        amountTextField.text = presenter?.subtractProduct()
    }
    
    @IBAction func addProduct(_ sender: Any) {
        amountTextField.text = presenter?.addProduct()
    }
    
    @objc func doneButtonTapped() {
        guard let text = amountTextField.text,
            text.first != "0",
            let amountDec = Decimal(string: text),
            amountDec >= 0
        else {
            amountTextField.text = presenter?.clearAmount()
            amountTextField.resignFirstResponder()
            return
        }
        presenter?.update(amount: amountDec)
        amountTextField.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        amountTextField.text = presenter?.amount
        amountTextField.resignFirstResponder()
    }
    
}

extension ShopViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        doneButtonTapped()
    }
}
