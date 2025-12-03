//
//  FavouriteView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(FavouritesViewModel.self) var favouritesViewModel
    var product = ProductsClient.fetchProducts()
    var body: some View {
        if(favouritesViewModel.myFavouriteProducts.isEmpty)
        {
            VStack{
                Text("Nothing here to show")
            }
        }
        else{
            NavigationStack{
                List{
                    ForEach(favouritesViewModel.myFavouriteProducts) { products in
                        
                        NavigationLink(destination: {
                            ProductDetailView(product: products)
                        }) {
                            HStack{
                                Image(products.image).resizable().scaledToFit().frame(width: 100,height: 100)
                                VStack(alignment: .leading){
                                    Text(products.title).font(.system(size: 16, weight: .bold))
                                    Text(products.description)
                                        .lineLimit(2)
                                        .font(.system(size: 14))
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FavouriteView().environment(FavouritesViewModel())
}
