//
//  CartViewController.swift
//  Yummy
//
//  Created by Amr Farouk on 7/25/21.
//  Copyright © 2021 Amr Farouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


final class CartViewController: UIViewController {
    
    // MARK: - Public properties -
    
    var presenter: CartPresenterInterface!
    
    // MARK: - Private properties -
    
    private let cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.reuseIdentifier)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 150))
//        footerView.backgroundColor = .systemPink
        tableView.tableFooterView = footerView
        return tableView
    }()
    
//    private let checkoutButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "creditcard"), for: .normal)
//        button.backgroundColor = .white
//        button.tintColor = .black
//        button.layer.cornerRadius = 56/2
//        button.applyShadow()
//        return button
//    }()
    
    private let footerCheckoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "creditcard"), for: .normal)
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 50/2
        button.applyShadow()
        return button
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$1000"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total:"
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
        setupUI()
    }
    
}

// MARK: - Extensions -

extension CartViewController: CartViewInterface {
}

private extension CartViewController {
    
    func setupRx() {
        let deleteCartItemTapped = PublishSubject<CartItem>()
        let decrementCartItemTapped = PublishSubject<CartItem>()
        let incrementCartItemTapped = PublishSubject<CartItem>()
        
        let output = Cart.ViewOutput(checkoutTapped: footerCheckoutButton.rx.tap.asObservable(),
                                     deleteCartItemTapped: deleteCartItemTapped,
                                     incrementCartItemTapped: incrementCartItemTapped,
                                     decrementCartItemTapped: decrementCartItemTapped)
        
        let input = presenter.configure(with: output)
        
        input.cartItems
        .drive(cartTableView.rx.items(cellIdentifier: CartItemCell.reuseIdentifier, cellType: CartItemCell.self)) { (row, cartItem, cell) in
            cell.cartItem = cartItem
            cell.deleteItemButton.rx.tap
                .map { cartItem }
                .bind(to: deleteCartItemTapped)
                .disposed(by: cell.rx.reuseBag)
            cell.incrementItemButton.rx.tap
                .map { cartItem }
                .bind(to: incrementCartItemTapped)
                .disposed(by: cell.rx.reuseBag)
            cell.decrementItemButton.rx.tap
                .map { cartItem }
                .bind(to: decrementCartItemTapped)
                .disposed(by: cell.rx.reuseBag)
        }
        .disposed(by: disposeBag)
        
        input.cartItems
            .map({ (cartItems) -> Double in
                cartItems.reduce(0) { (result, cartItem) -> Double in
                    result + Double(cartItem.count) * cartItem.dish.price
                }
            })
            .map({ (count) -> String in
                "$\(count)"
            })
            .drive(totalPriceLabel.rx.text)
        .disposed(by: disposeBag)
        
    }
    
    func setupUI() {
        setupNavigationBar()
                
        view.addSubview(cartTableView)
        cartTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let separatorLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            return view
        }()
        
        cartTableView.tableFooterView?.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        cartTableView.tableFooterView?.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.top.equalToSuperview().offset(32)
        }
        
        cartTableView.tableFooterView?.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-32)
            make.firstBaseline.equalTo(totalLabel.snp.lastBaseline)
        }
        
        cartTableView.tableFooterView?.addSubview(footerCheckoutButton)
        footerCheckoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(totalPriceLabel.snp.bottom).offset(16)
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        
//        view.addSubview(checkoutButton)
//        checkoutButton.snp.makeConstraints { (make) in
//            make.bottom.right.equalTo(-32)
//            make.size.equalTo(56)
//        }
    }
    
    
    func setupNavigationBar() {
        configureNavigationbar(withTitle: "Cart",
                               prefersLargeTitles: true)
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: {
                                                    let button = UIButton(type: .custom)
                                                    button.tintColor = .black
                                                    button.setImage(UIImage(systemName: "chevron.left") , for: .normal)
                                                    button.setTitle("Menu", for: .normal)
                                                    button.setTitleColor(button.tintColor, for: .normal)
                                                    button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
                                                    return button
                                                }())
    }
    
//    func setupTableView() {
////        cartTableView.delegate = self
////        cartTableView.dataSource = self
//
//        cartTableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.reuseIdentifier)
//        cartTableView.rowHeight = 200
//        cartTableView.separatorStyle = .none
//        cartTableView.allowsSelection = false
//        cartTableView.showsVerticalScrollIndicator = false
//    }
    
    @objc func backClicked() -> Void {
       self.navigationController?.dismiss(animated: true)
    }
}

//extension CartViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.reuseIdentifier, for: indexPath) as! CartItemCell
//        let dish = Dish(id: "", name: "Seafood Sauté or Alfredo", price: 19.5, image: "https://bit.ly/35yh09N", description: "")
//        cell.cartItem = CartItem(dish:dish, count: 1)
//        return cell
//    }
//}
