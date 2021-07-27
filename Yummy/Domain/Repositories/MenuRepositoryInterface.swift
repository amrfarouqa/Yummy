//
//  Repository.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import RxSwift

protocol MenuRepositoryInterface {
    func getMenu(restaurentId: String) -> Single<Menu>
}
