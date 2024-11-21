//
//  Product.swift
//  VIPERBootcamp
//
//  Created by C8V7P2 on 20/11/24.
//

struct ProductContainer: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    
    static var mock: Product {
        Product(id: 1, title: "Mock Product", price: 100)
    }
}


