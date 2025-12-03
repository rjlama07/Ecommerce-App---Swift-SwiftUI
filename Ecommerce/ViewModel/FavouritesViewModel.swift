//
//  FavouritesViewModel.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//



import Foundation
import SwiftUI


@Observable
class FavouritesViewModel{
   var myFavouriteProducts: [Product] = []
    
    func addToFavourite(_ product: Product){
        var contains = myFavouriteProducts.contains(product)
        if(!contains){
            myFavouriteProducts.append(product)
        }
        else{
            if let index = myFavouriteProducts.firstIndex(of: product){
                myFavouriteProducts.remove(at: index)
            }
        }
    }
    
    func isFavourite(_ product: Product) -> Bool{
        return myFavouriteProducts.contains(product)
    }
    
    
}
