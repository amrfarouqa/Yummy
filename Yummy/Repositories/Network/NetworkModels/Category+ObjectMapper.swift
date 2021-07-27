//
//  Category+ObjectMapper.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation


import ObjectMapper

extension Category: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        image       <- map["image"]
        dishes      <- map["dishes"]
    }
}
