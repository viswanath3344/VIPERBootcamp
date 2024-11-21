//
//  ProductListView.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import SwiftUI

struct ProductListView <Presenter: ProductListPresenterProtocol>: View {
    @StateObject var presenter: Presenter
    
    init(presenter: Presenter = ProductListPresenter()) {
        self._presenter = StateObject(wrappedValue: presenter)
    }
    
    var body: some View {
        VStack {
            Text("VIPER BOOTCAMP")
                List(presenter.products, id: \.id) { product in
                    HStack {
                        Text("\(product.id)")
                        Spacer()
                        Text(product.title)
                    }
                    .onTapGesture {
                        presenter.didselectProduct(product)
                    }
                }
            
            if let selectedProduct = presenter.selectedProduct  {
                ProductDetailView(product: selectedProduct)
            }
            
            if let errorMessage = presenter.errorMessage {
                Text(errorMessage)
                    .font(.largeTitle)
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    
            }
         
        }.onAppear {
            presenter.viewDidLoad()
        }
    }
}



#Preview {
    ProductListRouter.createModule()
}
