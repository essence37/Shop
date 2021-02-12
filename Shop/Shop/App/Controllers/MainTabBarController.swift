//
//  MainTabBarController.swift
//  Shop
//
//  Created by Пазин Даниил on 21.01.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Constants and Variables
    var settingsTableViewController: SettingsTableViewController!
    var settingsNavigationController: UINavigationController!
    
    var catalogCollectionViewController: UICollectionViewController!
    var catalogNavigationController: UINavigationController!
    
    var basketTableViewController: BasketTableViewController!
    var basketNavigationController: UINavigationController!
    
    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Создание экземпляров контроллеров.
        // Контроллер с настройками.
        settingsTableViewController = SettingsTableViewController()
        settingsNavigationController = UINavigationController(rootViewController: settingsTableViewController)
        // Контроллер, отвечающий за отображение списка товаров.
        catalogCollectionViewController = CatalogCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        catalogNavigationController = UINavigationController(rootViewController: catalogCollectionViewController)
        // Контроллер с корзиной.
        basketTableViewController = BasketTableViewController()
        basketNavigationController = UINavigationController(rootViewController: basketTableViewController)
        
        // Добавление контроллеров.
        setViewControllers([catalogNavigationController, basketNavigationController, settingsNavigationController], animated: true)
        // Отображение иконок и тайтлов.
        setupIconsAndTitles()
        tabBar.tintColor = .black
    }
    
    private func setupIconsAndTitles() {
        // Установка тайтлов.
        catalogNavigationController.title = "Search"
        basketNavigationController.title = "Cart"
        settingsNavigationController.title = "Settings"
        // Установка иконок.
        guard let items = tabBar.items else { return }
        items.first?.image = UIImage(systemName: "magnifyingglass")
        items[1].image = UIImage(systemName: "cart")
        items.last?.image = UIImage(systemName: "gear")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
