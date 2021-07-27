//
//  CheckoutViewController.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CheckoutViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: CheckoutPresenterInterface!

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

// MARK: - Extensions -

extension CheckoutViewController: CheckoutViewInterface {
}

private extension CheckoutViewController {

    func setupView() {
        let output = Checkout.ViewOutput()

        let input = presenter.configure(with: output)
    }

}
