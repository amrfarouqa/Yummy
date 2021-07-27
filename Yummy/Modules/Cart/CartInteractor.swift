//
//  CartInteractor.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift

final class CartInteractor {
    private let cartRepositoty: CartRepositoryInterface
    
    init(cartRepositoty: CartRepositoryInterface) {
        self.cartRepositoty = cartRepositoty
    }
}

// MARK: - Extensions -

extension CartInteractor: CartInteractorInterface {
    
    func getCartItems() -> Observable<[CartItem]> {
        return cartRepositoty.getItems().map { (dishes) -> [CartItem] in
            Dictionary(grouping: dishes) { $0.id }
                .map {  CartItem(dish: $1[0], count: $1.count) }
        }
    }
    
}
