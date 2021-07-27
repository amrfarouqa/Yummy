//
//  CartInterfaces.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CartWireframeInterface: WireframeInterface {
}

protocol CartViewInterface: ViewInterface {
}

protocol CartPresenterInterface: PresenterInterface {
    func configure(with output: Cart.ViewOutput) -> Cart.ViewInput
}

protocol CartFormatterInterface: FormatterInterface {
    func format(for input: Cart.FormatterInput) -> Cart.FormatterOutput
}

protocol CartInteractorInterface: InteractorInterface {
    func getCartItems() -> Observable<[CartItem]>
}

enum Cart {

    struct ViewOutput {
        let checkoutTapped: Observable<Void>
        let deleteCartItemTapped: PublishSubject<CartItem>
        let incrementCartItemTapped: PublishSubject<CartItem>
        let decrementCartItemTapped: PublishSubject<CartItem>
    }

    struct ViewInput {
        let models: FormatterOutput
        let cartItems: Driver<[CartItem]>
    }

    struct FormatterInput {
    }

    struct FormatterOutput {
    }

}
