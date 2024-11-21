//
//  ProductListPresenter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

class ProductListPresenter: ProductListPresenterProtocol {
    var router: ProductListRouter?
    var interactor : ProductListInteractorProtocol?
    @Published var products: [Product] = []
    
    func viewDidLoad() {
        refresh()
    }
    
    func didselectProduct(_ product: Product?) {
        
    }
    
    func refresh() {
        interactor?.fetchProductList()
    }
    
}

extension ProductListPresenter: ProducListInteractorOutputProtocol {
    func didFetchProductList(_ products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
        }
        
    }
    
    func didFetchProductDetails(_ product: Product) {

    }
}
