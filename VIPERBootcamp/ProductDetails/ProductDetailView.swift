//
//  Untitled.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product?
    
    init(product: Product? = nil) {
        self.product = product
    }
    
    var body: some View {
        if let product {
            VStack {
                Text("\(product.id)")
                Text(product.title)
                Text(String(product.price))
            }
        }else {
            Text("No product selected")
        }
    }
}


#Preview {
    ProductDetailView(product: .mock)
}
