//
//  DishDetailWireframe.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DishDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "DishDetail", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: DishDetailViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = DishDetailFormatter()
        let interactor = DishDetailInteractor()
        let presenter = DishDetailPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DishDetailWireframe: DishDetailWireframeInterface {
}
