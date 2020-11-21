//
//  BillingView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct PaymentView: View {
        
        @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
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
                        ForEach(0..<8) { index in
                            Rectangle()
                                .foregroundColor(Color(index <= 6 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    
                    
                    Text("We accept Visa and Mastercard credit cards.")
                    Text("We do not accept any debit cards.")
                    
                    Form {
                        Section(header: Text("Billing Info")) {
                                Picker(selection: $paymentType, label: Text("Payment Type (Visa and Mastercard)")) {
                                    ForEach(0..<paymentMethods.count) { index in
                                        Text(paymentMethods[index]).tag(paymentMethods[index])
                                    }
                                }
                                TextField("Cardholder Name", text: $cardholderName)
                                TextField("Card Number (no dashes / spaces)", text: $paymentCardNumber)
                                TextField("Expiration Month", text: $expirationMonth)
                                TextField("Expiration Year", text: $expirationYear)
                                TextField("CVV", text: $cvv)
                            
                        }
                    }
                        .padding()
                    
                    Spacer()
                    Button(action: {
                        
                        self.selection = 1
                        
                        UserDefaults.standard.set(self.paymentType, forKey: "paymentType")
                        UserDefaults.standard.set(self.cardholderName, forKey: "cardholderName")
                        UserDefaults.standard.set(self.paymentCardNumber, forKey: "paymentCardNumber")
                        UserDefaults.standard.set(self.expirationMonth, forKey: "expirationMonth")
                        UserDefaults.standard.set(self.expirationYear, forKey: "expirationYear")
                        UserDefaults.standard.set(self.cvv, forKey: "cvv")
                        
                    } ) { Text("Next >").font(.body).bold() }
                        .disabled(paymentType.isEmpty || cardholderName.isEmpty || paymentCardNumber.isEmpty || expirationMonth.isEmpty || expirationYear.isEmpty || cvv.isEmpty)
                        .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                        .foregroundColor(Color(.white))
                        .background(paymentType.isEmpty || cardholderName.isEmpty || paymentCardNumber.isEmpty || expirationMonth.isEmpty || expirationYear.isEmpty || cvv.isEmpty ? .gray : Color(UIColor.mainColor))
                        .padding()
                    
                    NavigationLink(destination: PrivacyView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    
                }
            
        }
    }
