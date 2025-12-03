//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    @State var favouritesManager = FavouritesViewModel()
    @State var cartManager = CartViewManager()
    @State var tagManager = TagManager()
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tagManager.selectedTag) {
                HomeView()
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                       
                CartView()
                    .tabItem{
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .tag(2)
                FavouriteView()
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                    }
                    .tag(3)
                
                
                
            }
            .preferredColorScheme(.light)
            .environment(favouritesManager)
            .environment(cartManager)
            .environment(tagManager)
        }
    }
}
