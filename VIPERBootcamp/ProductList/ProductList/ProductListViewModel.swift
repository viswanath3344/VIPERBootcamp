//
//  ProductListViewModel.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

class ProductListViewModel:ObservableObject, ProductListViewProtocol {
    @Published var products: [Product] = []
    @Published var selectedProduct: Product?
    
    var presenter: ProductListPresenterProtocol?
    
    init() {}
    
    func refresh() {
        self.presenter?.refresh()
    }
    
    func moveToDetail(_ product: Product) {
        self.presenter?.fetchProductDetails(productID: product.id)
    }
    
    func displayProducts(_ products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
        }
    }
    
    func openProductDetails(_ product: Product) {
        DispatchQueue.main.async {
            self.selectedProduct = product
        }
    }
}
