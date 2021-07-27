//
//  DishDetailViewController.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DishDetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: DishDetailPresenterInterface!

    // MARK: - Private properties -

    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

// MARK: - Extensions -

extension DishDetailViewController: DishDetailViewInterface {
}

private extension DishDetailViewController {

    func setupView() {
        let output = DishDetail.ViewOutput()

        let input = presenter.configure(with: output)
    }

}
