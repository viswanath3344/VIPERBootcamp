//
//  ProductListContract.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 21/11/24.
//

//MARK: View
protocol ProductListViewProtocol: View {
    var presenter:  any ProductListPresenterProtocol { get }
}

//MARK: Presenter
protocol ProductListPresenterProtocol: ObservableObject {
    var router: ProductListRouter? { get }
    var interactor: ProductListInteractorProtocol? { get }
    var products: [Product] { get set }
    
    func viewDidLoad()
    func refresh()
    func didselectProduct(_ product: Product?)
}

//MARK: Interactor
protocol ProductListInteractorProtocol: AnyObject {
    func fetchProductList()
    func fetchProductDetails(_ productId: Int)
}

//MARK: Interactor Output
protocol ProducListInteractorOutputProtocol: AnyObject {
    func didFetchProductList(_ products: [Product])
    func didFetchProductDetails(_ product: Product)
}


import SwiftUI

protocol Router {
    associatedtype ViewType: View
    static func createModule() -> ViewType
}

// Protocol extension for Associated type ?

protocol ProductListRouterProtocol  {
    static func createModule() -> ProductListView<ProductListPresenter>
    static func navigateToProductDetail(with product: Product) -> ProductDetailView
    static func presentError(_message: String)
}


