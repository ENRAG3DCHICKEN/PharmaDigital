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
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
//    //
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "longitude",ascending: true)]) var pharmacies: FetchedResults<Pharmacy>
//
    
    @FetchRequest(fetchRequest: Pharmacy.fetchRequest(.all)) var pharmacies: FetchedResults<Pharmacy>
    
    @State private var selection: Int? = nil
    
    @State private var selectedPharmacy: Pharmacy?
    
    var selectedPharmacyMarker: Binding<MKAnnotation?> {
        return Binding<MKAnnotation?>(
            get: { return selectedPharmacy },
            set: { annotation in
                if let pharmacy = annotation as? Pharmacy {
                    selectedPharmacy = pharmacy
                }
            }
        )
    }
    
    var body: some View {
        VStack {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
                          
            Form {
                Section {
                    Picker("Pharmacy", selection: $selectedPharmacy) {
                        ForEach(pharmacies, id: \.self) { pharmacy in
                            Text("\(pharmacy.pharmacyName!)").tag(pharmacy as Pharmacy?)
                        }

            }
            
            
            MapView(annotations: pharmacies.sorted(), selection: selectedPharmacyMarker)
                .frame(minHeight: 400)
                
        

//            List {
//                ForEach(pharmacies, id: \.pharmacyUUID) { pharmacy in
//                    Text(pharmacy.pharmacyName!)
//                }
//            }
            
            }
            }
            Button(action: {
                //Store into Core Datar
                
                
                self.selection = 1
                
                
                
            } ) { Text("Next >").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.mainColor))
                .padding()
                
                NavigationLink(destination: PatientInfoView(), tag: 1, selection: $selection) { EmptyView() }
        }
        
            .onAppear(perform: {
                print("start")
                populateCoreData_Pharmacy(context: context)
                print("done")
            })
    }
    }








//    @ObservedObject var pharmacies: Pharmacy_User
//        .onAppear(perform: {
//            let request = NSFetchRequest<Pharmacy_User>(entityName: "Pharmacy")
            //request.predicate = NSPredicate(format: "icao = %@", icao)
            //request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
//            let pharmacies = try? self.context.fetch(request)
            
//    @FetchRequest var pharmacies: FetchedResults<Pharmacy>
