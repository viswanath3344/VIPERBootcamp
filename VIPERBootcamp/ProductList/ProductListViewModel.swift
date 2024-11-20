//
//  ProductListViewModel.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import Foundation

class ProductListViewModel:ObservableObject, ProductListViewProtocol {
    @Published var products: [Product] = []
    
    var presenter: ProductListPresenterProtocol?
    
    init() {}
    
    func refresh() {
        self.presenter?.refresh()
    }
    
    
    func displayProducts(_ products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
        }
    }
}
