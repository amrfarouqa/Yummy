//
//  UIView+shadow.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit

extension UIView {
    func applyShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 12.0
        layer.shadowOpacity = 0.2
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
