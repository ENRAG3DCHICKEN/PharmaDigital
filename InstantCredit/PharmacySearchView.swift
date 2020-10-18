//
//  PharmacySearchView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct PharmacySearchView: View {
    

    @Environment(\.managedObjectContext) var context

    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "longitude",ascending: true)]) var pharmacies: FetchedResults<Pharmacy>
    
    var body: some View {
        List {
            ForEach(pharmacies, id: \.pharmacyUUID) { pharmacy in
                Text(pharmacy.pharmacyName!)
            }
        }
            .onAppear(perform: {
                populateCoreData_Pharmacy(context: self.context)
            })

        }

    

}






//    @Environment(\.managedObjectContext) var context
//    @ObservedObject var pharmacies: Pharmacy_User
//        .onAppear(perform: {
//            let request = NSFetchRequest<Pharmacy_User>(entityName: "Pharmacy")
            //request.predicate = NSPredicate(format: "icao = %@", icao)
            //request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
//            let pharmacies = try? self.context.fetch(request)
            
//    @FetchRequest var pharmacies: FetchedResults<Pharmacy>
