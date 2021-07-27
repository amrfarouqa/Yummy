//
//  HomeWireframe.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Home", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = HomeFormatter()
        let interactor = HomeInteractor(menuRepository: StubMenuRepository(),
                                        cartRepositoty: MemCartRepository())
        let presenter = HomePresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
    func navigate(to screen: HomeNavigationOption) {
        let cartWireframe = CartWireframe()
//        cartWireframe.viewController.modalPresentationStyle = .popover
//        viewController.presentWireframe(cartWireframe, animated: true, completion: nil)
        let nav = UINavigationController(rootViewController: cartWireframe.viewController)
        nav.modalPresentationStyle = .fullScreen
        viewController.present(nav, animated: true)
    }
}
