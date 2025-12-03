//
//  CartViewManager.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//




import Foundation


@Observable
class CartViewManager {
    var myCartItems: [CartItems] = []
    var totalItem: Int {
        myCartItems.count
    }
    var showAlert: Bool = false
    
    
    func addTOCart(_ product: Product) {
        if let index = myCartItems.firstIndex(where: { item in
            return  item.product.id == product.id
        })
        {
            myCartItems[index].quantity += 1
        }
        else{
            let cartItem = CartItems(quantity: 1, product: product)
            myCartItems.append(cartItem)
        }
      showAlert = true
        
    }
    
    func onDecrement(_ product: Product){
        if let index = myCartItems.firstIndex(where: {item in
        return item.product.id == product.id
        })
        {
            let quantity = myCartItems[index].quantity;
            if quantity > 1{
                myCartItems[index].quantity -= 1
            }
            else{
                myCartItems.remove(at: index)
            }
        }
    }
}


struct CartItems: Identifiable{
    var id = UUID()
    var quantity: Int
    var product: Product
}
