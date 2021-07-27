//
//  CheckoutWireframe.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CheckoutWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Checkout", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: CheckoutViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = CheckoutFormatter()
        let interactor = CheckoutInteractor()
        let presenter = CheckoutPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension CheckoutWireframe: CheckoutWireframeInterface {
}
