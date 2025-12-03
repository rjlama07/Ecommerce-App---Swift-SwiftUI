//
//  HomeModelView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//


import Foundation

enum Productfilter{
    case all,featured, highlyRated
}

@Observable
class HomeViewModal{
    var showProductGridView: Bool = false;
  
    
    func fetchProduct(filter: Productfilter)->[Product]{
        let product = ProductsClient.fetchProducts()
        switch filter {
        case .all:
            return product;
        case .featured:
            return product.filter { product in
                return product.isFeatured
            }
        case .highlyRated:
            return product.filter{product in
            return product.rating > 4
            }.sorted { p1, p2 in
                p1.rating > p2.rating   
            }
        }
    }
    
    
    
    
    
}
