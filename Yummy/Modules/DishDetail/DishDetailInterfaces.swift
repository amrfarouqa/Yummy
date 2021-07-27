//
//  DishDetailInterfaces.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DishDetailWireframeInterface: WireframeInterface {
}

protocol DishDetailViewInterface: ViewInterface {
}

protocol DishDetailPresenterInterface: PresenterInterface {
    func configure(with output: DishDetail.ViewOutput) -> DishDetail.ViewInput
}

protocol DishDetailFormatterInterface: FormatterInterface {
    func format(for input: DishDetail.FormatterInput) -> DishDetail.FormatterOutput
}

protocol DishDetailInteractorInterface: InteractorInterface {
}

enum DishDetail {

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
