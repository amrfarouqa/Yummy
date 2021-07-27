//
//  CheckoutInterfaces.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CheckoutWireframeInterface: WireframeInterface {
}

protocol CheckoutViewInterface: ViewInterface {
}

protocol CheckoutPresenterInterface: PresenterInterface {
    func configure(with output: Checkout.ViewOutput) -> Checkout.ViewInput
}

protocol CheckoutFormatterInterface: FormatterInterface {
    func format(for input: Checkout.FormatterInput) -> Checkout.FormatterOutput
}

protocol CheckoutInteractorInterface: InteractorInterface {
}

enum Checkout {

    struct ViewOutput {
    }

    struct ViewInput {
        let models: FormatterOutput
    }

    struct FormatterInput {
    }

    struct FormatterOutput {
    }

}
