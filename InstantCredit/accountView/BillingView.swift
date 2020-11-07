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
                    
                    HStack {
                        ForEach(0..<10) { index in
                            Rectangle()
                                .foregroundColor(Color(index == 7 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    
                    
                    Text("Please enter the following information exactly as it appears on your credit card statement.")
                    Text("We accept Visa and Mastercard credit cards. We do not accept any debit cards.")
                    
                    Form {
                        Section {
                            VStack {
                                TextField("Payment Type (Visa and Mastercard)", text: $paymentType)
                                TextField("Cardholder Name", text: $cardholderName)
                                TextField("Payment Card Number (no dashes or spaces)", text: $paymentCardNumber)
                                TextField("Expiration Month", text: $expirationMonth)
                                TextField("Expiration Year", text: $expirationYear)
                                TextField("CVV", text: $cvv)
                            }
                        }
                    }
                    
                    
                    
                    NavigationLink(destination: PrivacyView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                    
                }
            
        }
    }

struct BillingView_Previews: PreviewProvider {
    static var previews: some View {
        BillingView()
    }
}
