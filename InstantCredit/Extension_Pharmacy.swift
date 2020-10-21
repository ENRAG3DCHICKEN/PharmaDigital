//
//  Pharmacy.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-19.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import CoreData
import Combine
import UIKit

extension Pharmacy { // should probably be Identifiable & Comparable
   
    static func update(firebasePharmacy: Dictionary<String,Any>, in context: NSManagedObjectContext) {
        
        //Look for a pharmacy with a specific item:
        print(firebasePharmacy["PharmacyUUID"] as! CVarArg)
        let request = fetchRequest(NSPredicate(format: "pharmacyUUID = %@", firebasePharmacy["PharmacyUUID"] as! CVarArg))
        print(request)
        let results = (try? context.fetch(request)) ?? []
        print(results)
        let pharmacy = results.first ?? Pharmacy(context: context)
        print(pharmacy)
        
        //If pharmacy exists, update existing pharmacy in core data - else if pharmacy doesn't exist, create & populate!
        pharmacy.accreditationNumber = firebasePharmacy["AccreditationNumber"] as! Int64
        pharmacy.address1 = firebasePharmacy["Address1"] as? String
        pharmacy.address2 = firebasePharmacy["Address2"] as? String
        pharmacy.city = firebasePharmacy["City"] as? String
        pharmacy.longitude = Float(truncating: firebasePharmacy["Longitude"] as! NSNumber)
        pharmacy.latitude = Float(truncating: firebasePharmacy["Latitude"] as! NSNumber)
        pharmacy.pharmacyName = firebasePharmacy["PharmacyName"] as? String
        pharmacy.pharmacyUUID = UUID(uuidString: firebasePharmacy["PharmacyUUID"] as! String)
        pharmacy.phoneNumber = firebasePharmacy["PhoneNumber"] as! Int64
        pharmacy.postalCode = firebasePharmacy["PostalCode"] as? String
        pharmacy.province = firebasePharmacy["Province"] as? String
            
        pharmacy.objectWillChange.send()
        
        pharmacy.orderHistory.forEach { $0.objectWillChange.send() }
        
        
        //Add relationships will change!
        
        print(pharmacy)
        

        
        do {
            try context.save()
            
//            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//            try persistentContainer.viewContext.execute(deleteRequest)
            try context.save()
        } catch(let error) {
            print("couldn't save flight update to CoreData: \(error.localizedDescription)")
        }
    }

    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Pharmacy> {
        let request = NSFetchRequest<Pharmacy>(entityName: "Pharmacy")
//        request.sortDescriptors = [NSSortDescriptor(key: "arrival_", ascending: true)]
        request.predicate = predicate
        return request
    }
    

    // Downcast from NSSet to Set<Orders> and checks if nil, and returns empty array if nil
    var orderHistory: Set<Orders> {
        get { (orderHistory_ as? Set<Orders>) ?? [] }
        set { orderHistory_ = newValue as NSSet }
    }
    
    
}




