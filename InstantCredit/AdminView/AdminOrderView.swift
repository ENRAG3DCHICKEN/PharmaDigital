//
//  AdminOrderView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-08.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct AdminOrderView: View {
    
    @State private var chosenOrder: Orders
    
    init(chosenOrder: Orders) {
        _chosenOrder = State(wrappedValue: chosenOrder)
    }
    
    
    
    var body: some View {
        
        VStack {
            Form {
                
                //Order Details
                Section(header: Text("Order Details: ")) {
                    Text("Order Type: \(chosenOrder.orderType!)")
                    Text("Prescription Source: \(chosenOrder.prescriptionSource!)")
                    if chosenOrder.orderType == "New Prescription" || chosenOrder.orderType == "Transfer Prescription" {
                        Text("Prescription Source: \(chosenOrder.prescriptionSource!)")
                    }
                    if chosenOrder.orderType == "Refill Prescription" {
                        Text("Refill Prescription: \(chosenOrder.refill_prescription!)")
                    }
                    if chosenOrder.orderType == "Transfer Prescription" {
                        Text("Transfer from Pharmacy (Name): \(chosenOrder.trans_priorPharmacyName!)")
                        Text("Transfer from Pharmacy (Phone): \(chosenOrder.trans_priorPharmacyPhone!)")
                        Text("Transfer All Medication: \(chosenOrder.trans_transferAll ? "Yes" : "No")")
                    }
                    if chosenOrder.trans_transferAll == false {
                        Text("Transfer the Following Medications: \(chosenOrder.trans_prescription!)")
                    }
                }
                
                
            }
        }
        EmptyView()
        
        //Order Details
        
        
        //Show order submission Time
        // Order Completion status
        // order type
        //prescription source
        //refill rx
        //trans rx
        //trans prior pharmacy name and phone
        // trans transfer all
        
        
        // all patient data except flags, and selected pharmacy
        // all patient insurance details
        //all patient payment details
        
        // all patient health details
        //all patient fulfillment details
        
        
        
        
        
    }
}
