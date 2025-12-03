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
        myCartItems.reduce(0) { partialResult, cartItem in
            partialResult + cartItem.quantity
        }
    }
    var showAlert: Bool = false
    var displayTotalPrice: String {
        let totalPrice =  myCartItems.reduce(0.00) { partialResult, item in
            return partialResult + (Double(item.product.price) * Double(item.quantity))
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "$0.00"
    }
    
    
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
