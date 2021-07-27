//
//  StubRepository.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

struct StubMenuRepository : MenuRepositoryInterface {
    private let provider = MoyaProvider<RestaurentMenuService>(stubClosure: MoyaProvider.immediatelyStub)

    func getMenu(restaurentId: String) -> Single<Menu> {
        return provider.rx.request(.getMenu(restaurentId: restaurentId))
            .mapObject(Menu.self)
            .map{ $0 }
    }
}


