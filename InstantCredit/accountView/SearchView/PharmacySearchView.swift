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
    
    @State private var draft: Patient?
    

    
    
    var selectedPharmacy: Binding<MKAnnotation?> {
        return Binding<MKAnnotation?>(
            get: { return self.draft!.selectedPharmacy },
            set: { annotation in
                if let pharmacy = annotation as? Pharmacy {
                    self.draft!.selectedPharmacy = pharmacy
                }
            }
        )
    }
    
    var body: some View {
        NavigationView{
        VStack {
            
            Form {
                Section {
            
                    Picker("Pharmacy", selection: $draft.selectedPharmacy) {
                ForEach(pharmacies, id: \.self) { pharmacy in
                    Text("\(pharmacy.pharmacyName!)").tag(pharmacy.pharmacyName)
                }
            }
            
            
            
            MapView(annotations: pharmacies.sorted(), selection: selectedPharmacy)
                .frame(minHeight: 400)
        

//            List {
//                ForEach(pharmacies, id: \.pharmacyUUID) { pharmacy in
//                    Text(pharmacy.pharmacyName!)
//                }
//            }
            
            }
            }
        }
            .onAppear(perform: {
                populateCoreData_Pharmacy(context: self.context)
                
            })
    }
    }}







//    @ObservedObject var pharmacies: Pharmacy_User
//        .onAppear(perform: {
//            let request = NSFetchRequest<Pharmacy_User>(entityName: "Pharmacy")
            //request.predicate = NSPredicate(format: "icao = %@", icao)
            //request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
//            let pharmacies = try? self.context.fetch(request)
            
//    @FetchRequest var pharmacies: FetchedResults<Pharmacy>
