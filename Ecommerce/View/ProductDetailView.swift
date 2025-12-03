//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @Environment(CartViewManager.self) var cartManager
    var body: some View {
        @Bindable var cartManager = cartManager;
        VStack(alignment: .leading){
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            Group{
            Text(product.title)
                
                    .font(.system(size: 18,weight: .semibold))
                Text(product.description)
                    .font(.system(size: 16))
                    .padding(.top,5)
                Spacer()
                Button{
                    cartManager.addTOCart(product)
                }label: {
                    Text("Add To Cart")
                }
                .buttonStyle(PrimaryButton())
            }
            .padding(.horizontal,15)
            .alert("Item Added to cart", isPresented: $cartManager.showAlert) {
                Button {
                    
                } label: {
                    Text("OK")
                }

            } message: {
                
                Text("The following item is added to cart")
            }

                
         
        }
    }
}

#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts().first!).environment(CartViewManager())
}
