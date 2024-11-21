//
//  ProductListPresenter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

class ProductListPresenter: ProductListPresenterProtocol {
    
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    @Published var selectedProduct: Product?
    
    var router: ProductListRouter?
    var interactor : ProductListInteractorProtocol?

    func viewDidLoad() {
        refresh()
    }
    
    func didselectProduct(_ product: Product) {
        interactor?.fetchProductDetails(product.id)
    }
    
    func refresh() {
        interactor?.fetchProductList()
    }
}

extension ProductListPresenter: ProducListInteractorOutputProtocol {
    func didFail(with error: String) {
        DispatchQueue.main.async {
            self.errorMessage = error
            self.selectedProduct = nil
        }
    }
    
    func didFetchProductList(_ products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
            self.errorMessage = nil
        }
        
    }
    
    func didFetchProductDetails(_ product: Product) {
        DispatchQueue.main.async {
            self.errorMessage = nil
            self.selectedProduct = product
        }
    }
}
