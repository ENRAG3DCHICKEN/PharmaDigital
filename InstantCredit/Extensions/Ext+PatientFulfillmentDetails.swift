//
//  Ext+PatientShippingDetails.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/20/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData
import Combine
import UIKit

//PatientFulfillmentDetails Core Data, Optional Value Check
extension PatientFulfillmentDetails {
    
    //Attributes
    var address: String {
        get { address_! }
        set { address_ = newValue }
    }
    var city: String {
        get { city_! }
        set { city_ = newValue }
    }
    var fullName: String {
        get { fullName_! }
        set { fullName_ = newValue }
    }
    var phoneNumber: String {
        get { phoneNumber_! }
        set { phoneNumber_ = newValue }
    }
    var postalCode: String {
        get { postalCode_! }
        set { postalCode_ = newValue }
    }
    var province: String {
        get { province_! }
        set { province_ = newValue }
    }

    //One to One Relationships
    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
    //One to Many Relationships

}

extension PatientFulfillmentDetails {
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<PatientFulfillmentDetails> {
        let request = NSFetchRequest<PatientFulfillmentDetails>(entityName: "PatientFulfillmentDetails")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "fullName_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func update(fbPatientFulfillmentDetailsData: Dictionary<String,Any>, in context: NSManagedObjectContext, patient: Patient) {

       //Setup NSFetchRequest variable using the same authUID as Firebase
       let request = fetchRequest(NSPredicate(format: "patient_ = %@", patient))
                                      
       print("A")
       print(request)

           let results = (try? context.fetch(request)) ?? []
       print("B")
       print(results)
       
       let patientFulfillmentDetails = results.first ?? PatientFulfillmentDetails(context: context)
       print("C")
       print(patientFulfillmentDetails)
       
       //If patientFulfillmentDetails exists, update existing patientFulfillmentDetails in core data - else if pharmacy doesn't exist, create & populate!
        patientFulfillmentDetails.address = (fbPatientFulfillmentDetailsData["address"] as? String)!
        patientFulfillmentDetails.city = (fbPatientFulfillmentDetailsData["city"] as? String)!
        patientFulfillmentDetails.fullName = (fbPatientFulfillmentDetailsData["fullName"] as? String)!
        patientFulfillmentDetails.phoneNumber = (fbPatientFulfillmentDetailsData["phoneNumber"] as? String)!
        patientFulfillmentDetails.postalCode = (fbPatientFulfillmentDetailsData["postalCode"] as? String)!
        patientFulfillmentDetails.province = (fbPatientFulfillmentDetailsData["province"] as? String)!

        patientFulfillmentDetails.objectWillChange.send()
               
       print(patientFulfillmentDetails)
   
       do {
           
//            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//            try persistentContainer.viewContext.execute(deleteRequest)
           try context.save()
           
           //New code after bug on ipad vs iphone
        patientFulfillmentDetails.objectWillChange.send()
           
       } catch(let error) {
           print("couldn't save patient update to CoreData: \(error.localizedDescription)")
       }
    
   }
}
