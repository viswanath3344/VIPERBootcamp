//
//  ProductListPresenter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

protocol ProductListPresenterProtocol: AnyObject {
    func didFetchProducts(_ products: [Product])
    func didFetchProductDetails(_ product: Product)
    func fetchProductDetails(productID: Int)
    func refresh()
}

protocol ProductListViewProtocol: AnyObject {
    func displayProducts(_ products: [Product])
    func openProductDetails(_ product: Product)
}

class ProductListPresenter {
    weak var view: ProductListViewProtocol?
    var interactor : ProductListInteractorProtocol?
    
    func refresh() {
        interactor?.fetchProductList()
    }
    
    func fetchProductDetails(productID: Int) {
        interactor?.fetchProductDetails(productID)
    }
}

extension ProductListPresenter: ProductListPresenterProtocol {
    func didFetchProducts(_ products: [Product]) {
        print("DId fetch products", products)
        view?.displayProducts(products)
    }
    
    func didFetchProductDetails(_ product: Product) {
        view?.openProductDetails(product)
    }
}
