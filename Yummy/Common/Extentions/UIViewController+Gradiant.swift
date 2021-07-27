//
//  UIViewController+Gradian.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit


extension UIViewController {
    func configureGradiantLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
}
