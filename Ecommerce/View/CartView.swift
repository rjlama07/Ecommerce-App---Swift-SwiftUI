//
//  CartView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct CartView: View {
    @Environment(CartViewManager.self) var cartManager;
    var body: some View {
        
            NavigationStack{
                List{
                    ForEach(cartManager.myCartItems) { cartItem in
                        NavigationLink(destination: {
                            ProductDetailView(product: cartItem.product)
                        }) {
                            HStack{
                                Image(cartItem.product.image).resizable().scaledToFit().frame(width: 100,height: 100)
                                VStack(alignment: .leading){
                                    Text(cartItem.product.title).font(.system(size: 16, weight: .bold))
                                    Text(cartItem.product.description)
                                        .lineLimit(2)
                                        .font(.system(size: 14))
                                    Stepper("Quantity \(cartItem.quantity)") {
                                        cartManager.addTOCart(cartItem.product)
                                    } onDecrement: {
                                        cartManager.onDecrement(cartItem.product)
                                        
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
    CartView().environment(CartViewManager())
}
