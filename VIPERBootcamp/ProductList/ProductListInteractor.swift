//
//  ProductListIterator.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//


protocol ProductListInteractorProtocol: AnyObject {
    func fetchProductList()
 //  func fetchProductDetails(productId: Int)
}

class ProductListInteractor: ProductListInteractorProtocol {
    var products: [Product] = []
    weak var presenter: ProductListPresenter?
    
    func fetchProductList(){
        products = [
            .init(id: 1, title: "One", price: 200),
            .init(id: 2, title: "Two", price: 100),
            .init(id: 3, title: "Three", price: 100),
        ]
        
        presenter?.didFetchProducts(products)
    }
    
//    func fetchProductDetails(productId: Int) {
//        .success(.init(id: 1, title: "One details", price: 200.0))
//    }
//    
}
