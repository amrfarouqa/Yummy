//
//  CartFormatter.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CartFormatter {
}

// MARK: - Extensions -

extension CartFormatter: CartFormatterInterface {

    func format(for input: Cart.FormatterInput) -> Cart.FormatterOutput {
        return Cart.FormatterOutput()
    }

}
