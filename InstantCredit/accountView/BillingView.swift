//
//  BillingView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct BillingView: View {
        @State var selection: Int?
        
        @State private var paymentType: String = ""
        @State private var cardholderName: String = ""
        @State private var paymentCardNumber: String = ""
        @State private var expirationMonth: String = ""
        @State private var expirationYear: String = ""
        @State private var cvv: String = ""
        
        var body: some View {
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
                                .foregroundColor(Color(index == 7 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    
                    
                    Text("We accept Visa and Mastercard credit cards.")
                    Text("We do not accept any debit cards.")
                    
                    Form {
                        Section {
                                TextField("Payment Type (Visa and Mastercard)", text: $paymentType)
                                TextField("Cardholder Name", text: $cardholderName)
                                TextField("Card Number (no dashes / spaces)", text: $paymentCardNumber)
                                TextField("Expiration Month", text: $expirationMonth)
                                TextField("Expiration Year", text: $expirationYear)
                                TextField("CVV", text: $cvv)
                            
                        }
                    }
                    
                    Spacer()
                    Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                        .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                        .foregroundColor(Color(.white))
                        .background(Color(UIColor.mainColor))
                        .padding()
                    
                    NavigationLink(destination: PrivacyView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    
                }
            
        }
    }

struct BillingView_Previews: PreviewProvider {
    static var previews: some View {
        BillingView()
    }
}
