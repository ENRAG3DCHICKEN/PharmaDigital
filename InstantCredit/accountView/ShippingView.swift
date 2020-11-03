//
//  ShippingView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct ShippingView: View {
        @State var selection: Int?
        
        var body: some View {
            NavigationView {
                VStack {
                    NavigationLink(destination: BillingView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                    
                }
            }
        }
    }

struct ShippingView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingView()
    }
}
