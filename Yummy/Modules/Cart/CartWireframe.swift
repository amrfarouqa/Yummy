//
//  CartWireframe.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CartWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Cart", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: CartViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = CartFormatter()
        let interactor = CartInteractor(cartRepositoty: MemCartRepository())
        let presenter = CartPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension CartWireframe: CartWireframeInterface {
}
