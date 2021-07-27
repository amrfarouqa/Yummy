//
//  CartRepositoryInterface.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import RxSwift
import RxRelay

protocol CartRepositoryInterface {
    func add(dish: Dish)
    func remove(dish: Dish)
    func getItems() -> BehaviorRelay<[Dish]>
}
