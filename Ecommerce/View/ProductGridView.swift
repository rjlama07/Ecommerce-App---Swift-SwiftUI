//
//  ProductGridView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct ProductGridView: View {
    var filter: Productfilter
    var productGridViewModal: ProductGridViewModal;
    
    init(filter: Productfilter) {
        self.filter = filter
        self.productGridViewModal = ProductGridViewModal(productFilter: filter)
    }
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        TwoColumnGrid {
            ForEach(productGridViewModal.product) { product in
                FeaturedProductItem(product: product)
                
            }
        }
       
    }
}

#Preview {
    ProductGridView(filter: .all)
}
