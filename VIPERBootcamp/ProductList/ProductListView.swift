//
//  ProductListView.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    
    init (viewModel: ProductListViewModel) {
        _viewModel =  StateObject(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        VStack {
            Text("VIPER BOOTCAMP")
            List(viewModel.products, id: \.id) { product in
                HStack {
                    Text("\(product.id)")
                    Spacer()
                    Text(product.title)
                }
            }
        }.onAppear {
            viewModel.refresh()
        }
    }
}

#Preview {
    ProductListRouter.createModule()
}
