//
//  ProductListRouter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import SwiftUI

class ProductListRouter: ProductListRouterProtocol {
    
    static func presentError(_message: String) {}
    
    static func createModule() -> ProductListView<ProductListPresenter> {
        let presenter = ProductListPresenter()
        let view = ProductListView(presenter: presenter)
        
        let interactor = ProductListInteractor()
        
        presenter.interactor = interactor
        presenter.router = ProductListRouter()
        
        interactor.output = presenter
        
        return view
    }
    
    static func navigateToProductDetail(with product: Product) -> ProductDetailView {
        var productDetailView = ProductDetailsRouter.createModule()
        productDetailView.product = product
        
        return productDetailView
    }
}


class ProductDetailsRouter: Router {
    typealias ViewType = ProductDetailView
    
    static func createModule() -> ViewType {
        //        let viewModel = ProductDetailsViewModel()
        //        let presenter = ProductDetailsPresenter()
        //        let interactor = ProductDetailsInteractor()
        //        interactor.presenter = presenter
        //        presenter.interactor = interactor
        //        presenter.view = viewModel
        
        return ProductDetailView()
    }
}
