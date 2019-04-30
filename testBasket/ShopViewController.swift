//
//  ViewController.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let presenter = ShopPresenter(service: CurrencyService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)
        presenter.setupData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func checkoutClicked() {
        presenter.loadCurrencies()
    }


}

extension ShopViewController: UITableViewDelegate {
    
}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShopViewCell.self), for: indexPath) as? ShopViewCell else { return UITableViewCell() }
        cell.setup(presenter: presenter.shopItems[indexPath.row])
        return cell
    }
}

extension ShopViewController: ShopView {
    func reloadData() {
        tableView.reloadData()
    }
}
