//
//  ProductListPresenter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

protocol ProductListPresenterProtocol: AnyObject {
     func didFetchProducts(_ products: [Product])
     func refresh()
}

protocol ProductListViewProtocol: AnyObject {
    func displayProducts(_ products: [Product])
}

class ProductListPresenter: ProductListPresenterProtocol {
    weak var view: ProductListViewProtocol?
    var interactor : ProductListInteractorProtocol?
    
    
    func refresh() {
        interactor?.fetchProductList()
    }
    
    func didFetchProducts(_ products: [Product]) {
        print("DId fetch products", products)
        view?.displayProducts(products)
    }
}
