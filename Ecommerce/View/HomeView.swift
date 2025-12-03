//
//  HomeView.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct HomeView: View {
    @State var homeViewModel: HomeViewModal = HomeViewModal()
    @Environment(CartViewManager.self) var cartManager

    fileprivate var NavigationBarView: some View {
        ZStack {
            Text("Ecommerce App")
                .font(.system(size: 16, weight: .semibold))
            
            HStack {
                Spacer()
                ZStack {
                    Image(systemName: "cart.fill")
                    ZStack {
                        Circle().frame(height: 20)
                        Text("\(cartManager.totalItem)").foregroundStyle(.white).font(.system(size: 14))
                        
                    }.offset(CGSize(width: 10, height: -10))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 0) {
                    NavigationBarView
                    
                    Image(.banner)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .clipped()
                    
                    HStack {
                        Text("Featured").font(.system(size: 15, weight: .semibold))
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .featured)
                        } label: {
                            Text("View All").font(.system(size: 15, weight: .bold))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 0){
                            ForEach(homeViewModel.fetchProduct(filter: .featured)) { product in
                                FeaturedProductItem(product: product)
                            } .padding(.leading,16)
                        }
                    }.scrollIndicators(.hidden)
                    HStack {
                        Text("Top rated").font(.system(size: 15, weight: .semibold))
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .highlyRated)
                        } label: {
                            Text("View All").font(.system(size: 15, weight: .bold))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                    .padding(.top,16)
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 0){
                            ForEach(homeViewModel.fetchProduct(filter: .highlyRated)) { product in
                                FeaturedProductItem(product: product)
                            } .padding(.leading,16)
                        }
                    }.scrollIndicators(.hidden)
                    Button {
                        homeViewModel.showProductGridView.toggle()
                    } label: {
                        Text("Show Full Catalog")
                    }
                    .buttonStyle(PrimaryButton())
                    .padding(.horizontal,16)
                    .padding(.top,16)

                    Spacer()
                    
                }
            }
            .scrollIndicators(.hidden)
            .navigationDestination(isPresented: $homeViewModel.showProductGridView) {
                ProductGridView( filter: .all)
            }
        }
    }
}

#Preview {
    HomeView().environment(FavouritesViewModel()).environment(CartViewManager())
}
