//
//  ProductTableViewController.swift
//  Shop
//
//  Created by Пазин Даниил on 28.01.2021.
//

import UIKit
import FirebaseAnalytics

class ProductTableViewController: UITableViewController, UITabBarControllerDelegate {
    
    // MARK: - Constants and Variables
    
    private let requestFactory = RequestFactory()
    
    lazy var productView: ProductView = {
        let view = ProductView()
        view.frame = CGRect(x: 0, y: 0, width: 414, height: 414)
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    var product: Product? {
        didSet {
            getReviews()
        }
    }
    var reviews: [Review]?

    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        view.backgroundColor = .white
        
        productView.addToBasketButtonTapped = {
            self.addToBasket()
        }
        
        self.tabBarController?.delegate = self
        
        // Лог события "Открытие конкретного товара".
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-ProductTableViewController",
          AnalyticsParameterItemName: "Открытие конкретного товара",
          AnalyticsParameterContentType: "cont"
          ])
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Setting Views
    
    private func setupViews() {
        tableView.addSubview(productView)
    }
    
    // MARK: - Setting Constraints
    
    private func setupConstraints() {
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

        cell.textLabel?.text = reviews?[indexPath.row].text

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Methods
    
    private func getReviews() {
        guard let product = product else { return }
        
        let reviewsData = requestFactory.makeReviewsDataRequestFactory()
        reviewsData.getAllProductReviews(page: 1, productID: product.id) { response in
            switch response.result {
            case .success(let reviewsData):
                print(reviewsData)
                self.reviews = reviewsData.reviews
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func addToBasket() {
        guard let product = product else { return }
        
        let basketData = requestFactory.makeBasketDataRequestFactory()
        basketData.addToBasket(productID: product.id, quantity: 1) { [weak self] response in
            switch response.result {
            case .success(let basket):
                print(basket)
                // Лог события "Добавление товара в корзину".
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-ProductTableViewController",
                  AnalyticsParameterItemName: "Добавление товара в корзину",
                  AnalyticsParameterContentType: "cont"
                  ])
                DispatchQueue.main.async {
                    guard let navController = self?.tabBarController?.viewControllers?[1] as? UINavigationController,
                          let vc = navController.viewControllers.first as? BasketTableViewController else { return }
                    vc.basket.append(product)
                }
            case .failure(let error):
                print(error)
            }
        }
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
