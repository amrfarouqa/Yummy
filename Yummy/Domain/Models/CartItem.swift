//
//  CartItem.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation

struct CartItem {
    var id : String {
        return dish.id
    }
    var dish: Dish!
    
    var count: Int!
    
}
