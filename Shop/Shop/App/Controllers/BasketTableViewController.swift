//
//  BasketTableViewController.swift
//  Shop
//
//  Created by Пазин Даниил on 31.01.2021.
//

import UIKit
import FirebaseAnalytics

class BasketTableViewController: UITableViewController {

    // MARK: - Constants and Variables
    
    private let requestFactory = RequestFactory()
    
    var basket = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.register(BasketCell.self, forCellReuseIdentifier: "BasketCell")
        view.backgroundColor = .white
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return basket.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath)

        cell.textLabel?.text = basket[indexPath.row].name
        cell.detailTextLabel?.text = "\(basket[indexPath.row].price) руб."

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let basketData = requestFactory.makeBasketDataRequestFactory()
            basketData.deleteFromBasket(productID: 123) { response in
                switch response.result {
                case .success(let basket):
                    print(basket)
                    // Лог события "Удаление товара из корзины".
                    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                      AnalyticsParameterItemID: "id-BasketTableViewController",
                      AnalyticsParameterItemName: "Удаление товара из корзины",
                      AnalyticsParameterContentType: "cont"
                      ])
                    DispatchQueue.main.async {
                        self.basket.remove(at: indexPath.row)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(payBasket))
        navigationItem.title = "Cart"
        navigationItem.rightBarButtonItem = button
    }
    
    @objc private func payBasket() {
        let basketData = requestFactory.makeBasketDataRequestFactory()
        basketData.payBasket(basketID: 123) { response in
            switch response.result {
            case .success(let basket):
                print(basket)
                // Лог события "Оплату заказа".
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-BasketTableViewController",
                  AnalyticsParameterItemName: "Оплату заказа",
                  AnalyticsParameterContentType: "cont"
                  ])
                DispatchQueue.main.async {
                    self.basket.removeAll()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
