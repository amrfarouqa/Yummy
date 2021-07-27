//
//  MemCartRepository.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

fileprivate struct MemCart {
    static let shared = MemCart()
    let dishes: BehaviorRelay<[Dish]> = BehaviorRelay(value: [])
}


struct MemCartRepository : CartRepositoryInterface {
    
    func add(dish: Dish) {
        MemCart.shared.dishes.accept(MemCart.shared.dishes.value + [dish])
    }
    
    func remove(dish: Dish) {
        let dishes = MemCart.shared.dishes.value.filter { currentdish in
            currentdish.id != dish.id
        }
        
        MemCart.shared.dishes.accept(dishes)
    }
    
    func getItems() -> BehaviorRelay<[Dish]> {
        return MemCart.shared.dishes
    }
    
}
