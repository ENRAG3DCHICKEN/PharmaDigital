//
//  FirebaseStoresListener.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import Foundation
import Firebase
import CoreData
import SwiftUI



//struct firebasePharmacy {
//    private var accreditationNumber: Int64
//    private var address1: String
//    private var address2: String
//    private var city: String
//    private var longitude: Float
//    private var latitude: Float
//    private var pharmacyName: String
//    private var pharmacyUUID: UUID
//    private var phoneNumber: Int64
//    private var postalCode: String
//    private var province: String
//}
//

func populateCoreData_Pharmacy(context: NSManagedObjectContext) {

    //Populate Core Data asynchronously on secondary queue
    DispatchQueue.global(qos: .userInitiated).async {
        
        //Search firebase for documents = pharmacies
        let db = Firestore.firestore()
        db.collection("pharmacies").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data()["UUID"]!)")
//                    var lookupID: UUID = document.data()["UUID"]! as! UUID
                    
                    //PULL the entire object and update or put it into Core Data
                    print(document.data())
                    Pharmacy.update(fbPharmacyData: document.data(), in: context)
                }
            }
        }
    }
}

                    
                    
                    
                    
                    
                    //Search Core Data for pharmacies
//                    let request = NSFetchRequest<Pharmacy>(entityName: "Pharmacy")
                    
                    
                    
      
                    
//                    request.predicate = NSPredicate(format: "icao = %@", icao)
//                    request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
//                    let pharmacies = try? context.fetch(request)
                    
                    //after pulling a item from firebase - take that one item and attempt to query the exact same from core data - if unable (nil or empty array)
                    // simply add it - fire an objectiwllchange and context.save
                    
//
//                      func fetchIncomingFlights() {
//                          Self.flightAwareRequest?.stopFetching()
//                          if let context = managedObjectContext {
//                              Self.flightAwareRequest = EnrouteRequest.create(airport: icao, howMany: 90)
//                              Self.flightAwareRequest?.fetch(andRepeatEvery: 60)
//                              Self.flightAwareResultsCancellable = Self.flightAwareRequest?.results.sink { results in
//                                  for faflight in results {
//                                      Flight.update(from: faflight, in: context)
//                                  }
//                                  do {
//                                      try context.save()
//                                  } catch(let error) {
//                                      print("couldn't save flight update to CoreData: \(error.localizedDescription)")
//                                  }
//                              }
//                          }
//                      }
                          
                    
                    
//                    print(pharmacies)

                    
//                    if document.data()["UUID"] !=
                    




                    //    @ObservedObject var pharmacies: Pharmacy_User
                    //        .onAppear(perform: {

                                
                 
