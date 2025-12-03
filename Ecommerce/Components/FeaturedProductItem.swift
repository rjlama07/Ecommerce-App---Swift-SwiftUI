//
//  FeaturedProduct.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct FeaturedProductItem: View {
    @Environment(FavouritesViewModel.self) var favouritesViewModel: FavouritesViewModel;
    var product: Product
    var body: some View {
        NavigationLink(destination: {
            ProductDetailView(product: product)
        }) {
            VStack(alignment: .leading,spacing: 5){
                Image(product.image).resizable().aspectRatio(contentMode: .fill).frame(width: 150,height: 150)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 8,topTrailing: 8
                            )
                        )
                    ).clipped()
                Group{
                    Text(product.title).font(.system(size: 15,weight: .semibold))
                    Text(product.displayPrice).font(.system(size: 15))
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 14))
                            .foregroundStyle(.yellow)
                        Text(product.displayRating).font(.system(size: 14))
                    }
                }
                .padding(.horizontal,5)
                
                Spacer()
            }
            .frame(width: 150, height: 270)
            .overlay(alignment: .topTrailing, content: {
                Button {
                    favouritesViewModel.addToFavourite(product)
                } label: {
                    Image(systemName:favouritesViewModel.isFavourite(product) ? "heart.fill" : "heart").padding(10)
                }
                
            })
            .overlay {
                RoundedRectangle(cornerRadius: 8).stroke(Color(uiColor: UIColor.gray).opacity(0.4),lineWidth: 1)
            }
        }
        .foregroundStyle(.black)
        
    }
}

#Preview {
//    FeaturedProductItem()
}
