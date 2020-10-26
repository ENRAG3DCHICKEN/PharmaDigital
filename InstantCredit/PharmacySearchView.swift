//
//  PharmacySearchView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData
import MapKit

struct PharmacySearchView: View {
    

//
    @Environment(\.managedObjectContext) var context
//    //
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "longitude",ascending: true)]) var pharmacies: FetchedResults<Pharmacy>
//
    
    @FetchRequest(fetchRequest: Pharmacy.fetchRequest(.all)) var pharmacies: FetchedResults<Pharmacy>
    
    @State private var draft: Pharmacy?
    
    
    
    var destination: Binding<MKAnnotation?> {
        return Binding<MKAnnotation?>(
            get: { return self.draft },
            set: { annotation in
                if let pharmacy = annotation as? Pharmacy {
                    self.draft = pharmacy
                }
            }
        )
    }
    
    var body: some View {
        
        VStack {
            
//            Picker("Pharmacy", selection: $selectedPharmacy) {
//                ForEach(pharmacies, id: \.pharmacyUUID) { pharmacy in
//                    Text("\(pharmacy.pharmacyName!)").tag(pharmacy)
//                }
//            }
//            
            
            
            MapView(annotations: pharmacies, selection: destination)
                .frame(minHeight: 400)
        
//
//            List {
//                ForEach(pharmacies, id: \.pharmacyUUID) { pharmacy in
//                    Text(pharmacy.pharmacyName!)
//                }
//            }
            
            
        }
            .onAppear(perform: {
                populateCoreData_Pharmacy(context: self.context)
            })
    }
}


//









//    @ObservedObject var pharmacies: Pharmacy_User
//        .onAppear(perform: {
//            let request = NSFetchRequest<Pharmacy_User>(entityName: "Pharmacy")
            //request.predicate = NSPredicate(format: "icao = %@", icao)
            //request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
//            let pharmacies = try? self.context.fetch(request)
            
//    @FetchRequest var pharmacies: FetchedResults<Pharmacy>
