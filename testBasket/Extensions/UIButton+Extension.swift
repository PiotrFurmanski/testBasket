//
//  UIButton+Extension.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
