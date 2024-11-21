//
//  ProductListRouter.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import SwiftUI

protocol Router {
    associatedtype ViewType: View
    static func createModule() -> ViewType
}

// Protocol extension for Associated type ?

class ProductListRouter: Router {
    typealias ViewType = ProductListView
    
    static func createModule() -> ViewType {
        let viewModel = ProductListViewModel()
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewModel
        viewModel.presenter = presenter
        
        return ProductListView(viewModel: viewModel)
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
