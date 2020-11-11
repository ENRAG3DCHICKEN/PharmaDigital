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
    
        @State var shipFullName: String = ""
        @State var shipAddress: String = ""
        @State var shipCity: String = ""
        @State var shipProvince: String = ""
        @State var shipPostalCode: String = ""
        @State var shipPhoneNumber: String = ""
        
        var body: some View {
            
            //ADD in a local pickup or a same-day delivery option
            
            
            
            
                VStack {
                    
                    Text("")
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    Image("cropped-img7")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                        .overlay(
                            Text("Help us match you to the right counselor.")
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .opacity(0.7)
                        )
                          
                    
                    HStack {
                        ForEach(0..<10) { index in
                            Rectangle()
                                .foregroundColor(Color(index == 6 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    Form {
                        Section(header: Text("Delivery Shipping Address")) {
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
                    }
                    .padding()
                    
                    Spacer()
                    Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                        .disabled(shipFullName.isEmpty || shipAddress.isEmpty || shipProvince.isEmpty || shipPostalCode.isEmpty || shipPhoneNumber.isEmpty)
                        .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                        .foregroundColor(Color(.white))
                        .background(shipFullName.isEmpty || shipAddress.isEmpty || shipProvince.isEmpty || shipPostalCode.isEmpty || shipPhoneNumber.isEmpty ? .gray : Color(UIColor.mainColor))
                        .padding()
                    
                    
                    NavigationLink(destination: BillingView(), tag: 1, selection: $selection) { EmptyView() }
                    
                }
            
        }
    }

struct ShippingView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingView()
    }
}
