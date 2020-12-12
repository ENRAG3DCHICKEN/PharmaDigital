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

                    
       
