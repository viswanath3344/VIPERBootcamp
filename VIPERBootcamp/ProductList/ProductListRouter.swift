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

class ProductListRouter: Router {
    typealias ViewType = ProductListView
    
    static func createModule() -> ProductListView {
        let viewModel = ProductListViewModel()
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewModel
        viewModel.presenter = presenter
        
        return ProductListView(viewModel: viewModel)
    }
    
    func navigateToProductDetail(with product: Product) {
        
    }
}
