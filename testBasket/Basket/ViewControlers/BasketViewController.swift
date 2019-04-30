//
//  BasketViewController.swift
//  testBasket
//
//  Created by Piotr Furmanski on 30/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {

    private struct Constant {
        static let cellWidth = 80
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sumLabel: UILabel!
    
    var presenter: BasketPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(view: self)
        presenter?.loadCurrencies()
        sumLabel.text = presenter?.totalAmount
    }
    

}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter, let cell = tableView.dequeueReusableCell(withIdentifier:
            String(describing: BasketCell.self), for: indexPath) as? BasketCell else { return UITableViewCell() }
        cell.setup(presenter: presenter.selectedItems[indexPath.row])
        return cell
    }
}

extension BasketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfCollectionRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CurrencyCell.self), for: indexPath) as? CurrencyCell
        cell?.setup(with: presenter?.currencyPairModels[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension BasketViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currencyModel = presenter?.currencyPairModels[indexPath.row] else { return }
        if indexPath.row != presenter?.selectedRow {
            presenter?.selectedRow = indexPath.row
            sumLabel.text = presenter?.calculateAmount(for: currencyModel)
        } else {
            presenter?.selectedRow = nil
            sumLabel.text = presenter?.totalAmount
            collectionView.reloadData()
        }
    }
}

extension BasketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = Constant.cellWidth * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
        
        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(Constant.cellWidth), height: collectionView.bounds.height)
    }
}

extension BasketViewController: BasketView {
    func reloadData() {
        collectionView.reloadData()
    }
}
