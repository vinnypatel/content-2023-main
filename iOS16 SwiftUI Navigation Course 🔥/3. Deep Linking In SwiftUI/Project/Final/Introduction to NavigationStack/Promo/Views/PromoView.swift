//
//  PromoView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 09/02/2023.
//

import SwiftUI

struct PromoView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    
    let data: PromoData
    
    var body: some View {
        VStack {
            Text(data.pct, format: .percent)
                .padding(50)
                .font(.system(size: 60,
                              weight: .heavy,
                              design: .rounded))
                .background(
                    Circle().fill(.red)
                )
                .foregroundColor(.white)
            Text("Get this **Great Offer** 🔥🔥🔥")
                .font(.title2)
            Text(data.desc)
                .italic()
            Button("Apply Discount") {
                cartManager.set(promo: data)
                routerManager.replace(stack: [.cart])
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .padding(.top, 16)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(data: .init(desc: "enjoy discount", pct: 0.3))
            .environmentObject(NavigationRouter())
            .environmentObject(ShoppingCartManager())
    }
}
