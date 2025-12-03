//
//  Untitled 2.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI
import Foundation

struct TwoColumnGrid<Content: View>: View{
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: column) {
                content()
            }
        }
    }
}
