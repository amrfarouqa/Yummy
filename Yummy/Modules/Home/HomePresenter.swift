//
//  HomePresenter.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HomePresenter {

    // MARK: - Private properties -

    private unowned let view: HomeViewInterface
    private let formatter: HomeFormatterInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface

    // MARK: - Lifecycle -

    init(view: HomeViewInterface, formatter: HomeFormatterInterface, interactor: HomeInteractorInterface, wireframe: HomeWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {

    func configure(with output: Home.ViewOutput) -> Home.ViewInput {

        let formatterInput = Home.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)
        
        _ = output.openCartTapped
            .subscribe(onNext: { [weak self] in
                self?.handleOpenCartTap()
            })
        
        _ = output.addToCartTapped
            .subscribe(onNext: { [weak self] dish in
                self?.handleAddToCart(dish: dish)
            })
        
        return Home.ViewInput(models: formatterOutput,
                              categories: getCategories(),
                              cartItemsCount: getCartItemsCount())
    }
    
    func handleAddToCart(dish: Dish) {
        print("DEBUG: handleAddToCart \(dish.id)")
        interactor.addToCart(dish: dish)
    }
    
    func handleRemoveFromCart(dish: Dish) {
        interactor.removeFromCart(dish: dish)
    }
    
    func getCartItemsCount () -> Driver<String> {
        return interactor.getCartItems()
                .map { "\($0.count)" }
                .asDriver(onErrorDriveWith: .never())

    }
    
    func handleOpenCartTap() {
        wireframe.navigate(to: .cart)
    }
    
    func getCategories () -> Driver<[Category]> {
        return interactor.getMenu().asObservable()
            .map { $0.categories ?? [] }
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .asDriver(onErrorDriveWith: .never())
    }

}
