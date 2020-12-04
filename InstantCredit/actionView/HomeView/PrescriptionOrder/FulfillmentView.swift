//
//  ShippingView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct FulfillmentView: View {
    
        @State private var selection: Int?
    
        @State private var optionLocalPickup: Bool = true
        @State private var optionDelivery_Regular: Bool = false
        @State private var optionDelivery_Sameday: Bool = false
    
        @State private var shipFullName: String = ""
        @State private var shipAddress: String = ""
        @State private var shipCity: String = ""
        @State private var shipProvince: String = ""
        @State private var shipPostalCode: String = ""
        @State private var shipPhoneNumber: String = ""
        
        var body: some View {
            
        let od1 = Binding<Bool>(get: { self.optionLocalPickup }, set: { self.optionLocalPickup = $0; self.optionDelivery_Regular = false; self.optionDelivery_Sameday = false })
        let od2 = Binding<Bool>(get: { self.optionDelivery_Regular }, set: { self.optionDelivery_Regular = $0; self.optionLocalPickup = false; self.optionDelivery_Sameday = false })
        let od3 = Binding<Bool>(get: { self.optionDelivery_Sameday }, set: { self.optionDelivery_Sameday = $0; self.optionLocalPickup = false; self.optionDelivery_Regular = false })

        VStack {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            Text("Checkout View").font(.headline)
            Form {
                Toggle(isOn: od1) { Text("In-Store Pick Up - FREE") }
                Toggle(isOn: od2) { Text("Ship to Home, Regular Delivery - FREE") }
                Toggle(isOn: od3) { Text("Ship to Home, Same-Day Delivery - $5") }
                
            }
                
            if optionLocalPickup == true {
                Spacer()
            }
            
            if optionDelivery_Regular == true || optionDelivery_Sameday == true {
                Form {
                       TextField("Full Name", text: $shipFullName)
                        TextField("Address", text: $shipAddress)
                        Picker(selection: $shipProvince, label: Text("Province")) {
                            ForEach(0..<provinces.count) { index in
                                Text(provinces[index]).tag(provinces[index])
                            }
                        }
                        TextField("Postal Code", text: $shipPostalCode)
                        TextField("Phone", text: $shipPhoneNumber)
                    }
                        .padding()
            }
            
            
            Button(action: { self.selection = 0 } ) { Text("< Cancel").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.gradiant1))
                .padding()
            
            Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                .disabled(shipFullName.isEmpty || shipAddress.isEmpty || shipProvince.isEmpty || shipPostalCode.isEmpty || shipPhoneNumber.isEmpty)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(shipFullName.isEmpty || shipAddress.isEmpty || shipProvince.isEmpty || shipPostalCode.isEmpty || shipPhoneNumber.isEmpty ? .gray : Color(UIColor.mainColor))
                .padding()
            
            NavigationLink(destination: HomeView(), tag: 0, selection: $selection) { EmptyView() }
            
            NavigationLink(destination: SummaryCompletionView(), tag: 1, selection: $selection) { EmptyView() }
                    
        }
    }
}

