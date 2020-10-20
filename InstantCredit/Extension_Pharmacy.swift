//
//  Pharmacy.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-19.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import CoreData
import Combine

extension Pharmacy { // should probably be Identifiable & Comparable
   
    static func update(firebasePharmacy: Dictionary<String,Any>, in context: NSManagedObjectContext) {
        
        //Look for a pharmacy with a specific item:
        let request = fetchRequest(NSPredicate(format: "pharmacyUUID = %@", firebasePharmacy["PharmacyUUID"] as! CVarArg))
        let results = (try? context.fetch(request)) ?? []
        let pharmacy = results.first ?? Pharmacy(context: context)
        
        //If pharmacy exists, update existing pharmacy in core data - else if pharmacy doesn't exist, create & populate!
        pharmacy.accreditationNumber = firebasePharmacy["AccreditationNumber"] as! Int64
        pharmacy.address1 = firebasePharmacy["Address1"] as? String
        pharmacy.address2 = firebasePharmacy["Address2"] as? String
        pharmacy.city = firebasePharmacy["City"] as? String
        pharmacy.longitude = Float(firebasePharmacy["Longitude"] as! NSNumber)
        pharmacy.latitude = Float(firebasePharmacy["Latitude"] as! NSNumber)
        pharmacy.pharmacyName = firebasePharmacy["PharmacyName"] as? String
        pharmacy.pharmacyUUID = firebasePharmacy["PharmacyUUID"] as? UUID
        pharmacy.phoneNumber = firebasePharmacy["PhoneNumber"] as! Int64
        pharmacy.postalCode = firebasePharmacy["PostalCode"] as? String
        pharmacy.province = firebasePharmacy["Province"] as? String
            
        pharmacy.objectWillChange.send()
        //Add relationships will change!
        
        do {
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
}

