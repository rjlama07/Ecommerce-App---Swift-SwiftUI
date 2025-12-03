//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    @State var favouritesManager = FavouritesViewModel()
    @State var cartManager = CartViewManager()
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                       
                CartView()
                    .tabItem{
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                FavouriteView()
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                    }
                
                
                
            }
            .preferredColorScheme(.light)
            .environment(favouritesManager)
            .environment(cartManager)
        }
    }
}
