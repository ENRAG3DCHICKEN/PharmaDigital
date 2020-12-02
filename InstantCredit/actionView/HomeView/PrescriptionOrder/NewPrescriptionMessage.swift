//
//  NewPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-11-28.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct NewPrescriptionMessage: View {
    
    @State private var selection: Int?
    
    @State private var chosenPharmacy: Pharmacy?
    
    init(chosenPharmacy: Pharmacy?) {
        _chosenPharmacy = State(wrappedValue: chosenPharmacy)
    }
    
    
    var body: some View {
        
        VStack {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Text("Only place transfer requests now for prescriptions you wish to have filled at this time")
            Text("Please place your orders for future prescriptions near the time you wish to have them shipped")
            
            Spacer()
            
            Button(action: {
                self.selection = 1
            } ) { Text("Next >").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.mainColor))
                .padding()
            
            NavigationLink(destination: NewPrescriptionSelection(chosenPharmacy: chosenPharmacy!), tag: 1, selection: $selection) { EmptyView() }

        }
    }
}
