//
//  Untitled.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 2/12/2025.
//

import SwiftUI

struct PrimaryButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
       return configuration.label
            .font(.system(size: 16,weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
