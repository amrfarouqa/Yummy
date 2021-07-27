//
//  DishDetailPresenter.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class DishDetailPresenter {

    // MARK: - Private properties -

    private unowned let view: DishDetailViewInterface
    private let formatter: DishDetailFormatterInterface
    private let interactor: DishDetailInteractorInterface
    private let wireframe: DishDetailWireframeInterface

    // MARK: - Lifecycle -

    init(view: DishDetailViewInterface, formatter: DishDetailFormatterInterface, interactor: DishDetailInteractorInterface, wireframe: DishDetailWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension DishDetailPresenter: DishDetailPresenterInterface {

    func configure(with output: DishDetail.ViewOutput) -> DishDetail.ViewInput {

        let formatterInput = DishDetail.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)

        return DishDetail.ViewInput(models: formatterOutput)
    }

}
