//
//  HomeFormatter.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeFormatter {
}

// MARK: - Extensions -

extension HomeFormatter: HomeFormatterInterface {

    func format(for input: Home.FormatterInput) -> Home.FormatterOutput {
        return Home.FormatterOutput()
    }

}
