//
//  SummaryCompletionView.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/11/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct SummaryCompletionView: View {
    
    @State private var FullName: String
    @State private var Address: String
    @State private var PostalCode: String
    @State private var PhoneNumber: String
    @State private var EmailAddress: String
    
    @State private var shipFullName: String
    @State private var shipAddress: String
    @State private var shipPostalCode: String
    
    @State private var PaymentType: String
    @State private var CardholderName: String
    @State private var PaymentCardNumber: String
    @State private var ExpirationMonth: String
    @State private var ExpirationYear: String
    
    @State private var FulfillmentMethod: String
    
    init() {
        _FullName = State(wrappedValue: "")
        _Address = State(wrappedValue: "")
        _PostalCode = State(wrappedValue: "")
        _PhoneNumber = State(wrappedValue: "")
        _EmailAddress = State(wrappedValue: "")
        
        _shipFullName = State(wrappedValue: "")
        _shipAddress = State(wrappedValue: "")
        _shipPostalCode = State(wrappedValue: "")
    
        _PaymentType = State(wrappedValue: "")
        _CardholderName = State(wrappedValue: "")
        _PaymentCardNumber = State(wrappedValue: "")
        _ExpirationMonth = State(wrappedValue: "")
        _ExpirationYear = State(wrappedValue: "")
        
        _FulfillmentMethod = State(wrappedValue: "")
    }
    
    
    var body: some View {
        VStack {
            Section(header: Text("Your prescription will be billed to: ")) {
                Text(FullName)
                Text(Address)
                Text(PostalCode)
                Text(PhoneNumber)
                Text(EmailAddress)
            }
            
            if FulfillmentMethod != "Local Pickup" {
                Section(header: Text("Your Prescription will be shipped to: ")) {
                    Text(shipFullName)
                    Text(shipAddress)
                    Text(shipPostalCode)
                }
            }
            Section(header: Text("Credit Card Information")) {
                Text(PaymentType)
                Text(CardholderName)
                Text(PaymentCardNumber)
                Text("\(ExpirationMonth)" + "/" + "\(ExpirationYear)")
                
            }
            
            if FulfillmentMethod == "Local Pickup" {
                Section(header: Text("Fulfillment Method: ")) {
                // This should be either local pickup or delivery optio'n
                    Text("Shipping Method: ")
                    Text("Processing Time: ")
                    Text("Shipping Time: ")
                    Text("Time to Delivery: ")
                    Text("Shipping Cost: ")
                    
                    //Local Pickup Address
                    
                   
                }
                
                Section {
                    
                }
                
                
            }
        }
        //
        
    }
}

struct SummaryCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCompletionView()
    }
}
