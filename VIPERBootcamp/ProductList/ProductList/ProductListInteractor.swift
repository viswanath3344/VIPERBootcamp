//
//  ProductListIterator.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

class ProductListInteractor: ProductListInteractorProtocol {
    var products: [Product] = []
    weak var output: ProductListPresenter?
    
    func fetchProductList(){
        products = [
            .init(id: 1, title: "One", price: 200),
            .init(id: 2, title: "Two", price: 100),
            .init(id: 3, title: "Three", price: 100),
        ]
        
        output?.didFetchProductList(products)
    }
    
    func fetchProductDetails(_ productId: Int) {
        // Manipulate for error message when clicks on product with ID "3"
        products =  [
            .init(id: 1, title: "One", price: 200),
            .init(id: 2, title: "Two", price: 100),
        ]
        
        guard let selectedProduct = products.first(where: {$0.id == productId}) else {
            output?.didFail(with: "Unable to get product details")
            return
        }
        
        output?.didFetchProductDetails(selectedProduct)
    }

}
