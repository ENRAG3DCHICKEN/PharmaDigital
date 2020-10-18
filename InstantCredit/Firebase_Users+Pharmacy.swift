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

let db = Firestore.firestore()


func populateCoreData_Pharmacy(context: NSManagedObjectContext) {

    //Populate Core Data asynchronously on secondary queue
    DispatchQueue.global(qos: .userInitiated).async {
        
        //Search firebase for documents = pharmacies
        db.collection("pharmacies").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data()["UUID"]!)")
                    
                    //Search Core Data for pharmacies
                    let request = NSFetchRequest<Pharmacy>(entityName: "Pharmacy")
//                    request.predicate = NSPredicate(format: "icao = %@", icao)
                    request.sortDescriptors = [NSSortDescriptor(key: "location", ascending: true)]
                    let pharmacies = try? context.fetch(request)
//                    print(pharmacies)

                    
//                    if document.data()["UUID"] !=
                    




                    //    @ObservedObject var pharmacies: Pharmacy_User
                    //        .onAppear(perform: {

                                
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
