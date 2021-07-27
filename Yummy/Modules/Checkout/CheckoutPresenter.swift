//
//  CheckoutPresenter.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CheckoutPresenter {

    // MARK: - Private properties -

    private unowned let view: CheckoutViewInterface
    private let formatter: CheckoutFormatterInterface
    private let interactor: CheckoutInteractorInterface
    private let wireframe: CheckoutWireframeInterface

    // MARK: - Lifecycle -

    init(view: CheckoutViewInterface, formatter: CheckoutFormatterInterface, interactor: CheckoutInteractorInterface, wireframe: CheckoutWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension CheckoutPresenter: CheckoutPresenterInterface {

    func configure(with output: Checkout.ViewOutput) -> Checkout.ViewInput {

        let formatterInput = Checkout.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)

        return Checkout.ViewInput(models: formatterOutput)
    }

}
