//
//  Ext+PatientPaymentDetails.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-11-28.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//


import SwiftUI
import CoreData
import Combine
import UIKit

//PatientPaymentDetails Core Data, Optional Value Check
extension PatientPaymentDetails {
    
    //Attributes
    var cardholderName: String {
        get { cardholderName_! }
        set { cardholderName_ = newValue }
    }
    var cvv: Int64 {
        get { cvv_ }
        set { cvv_ = newValue }
    }
    var expirationMM: Int64 {
        get { expirationMM_ }
        set { expirationMM_ = newValue }
    }
    var expirationYY: Int64 {
        get { expirationYY_ }
        set { expirationYY_ = newValue }
    }
    var paymentCardNumber: Int64 {
        get { paymentCardNumber_ }
        set { paymentCardNumber_ = newValue }
    }
    var paymentType: String {
        get { paymentType_! }
        set { paymentType_ = newValue }
    }
    
    //One to One Relationships
    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
    //One to Many Relationships

}

extension PatientPaymentDetails {
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<PatientPaymentDetails> {
        let request = NSFetchRequest<PatientPaymentDetails>(entityName: "PatientPaymentDetails")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "cardholderName_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func update(fbPatientPaymentDetailsData: Dictionary<String,Any>, in context: NSManagedObjectContext, patient: Patient) {
        
        //Setup NSFetchRequest variable using the same authUID as Firebase
        let request = fetchRequest(NSPredicate(format: "patient_ = %@", patient))
        
        print("A")
        print(request)
        
        let results = (try? context.fetch(request)) ?? []
        print("B")
        print(results)
        
        let patientPaymentDetails = results.first ?? PatientPaymentDetails(context: context)
        print("C")
        print(patientPaymentDetails)
        
        //       If patientHealthDetails exists, update existing patientHealthDetails in core data - else if pharmacy doesn't exist, create & populate!
        patientPaymentDetails.cardholderName = (fbPatientPaymentDetailsData["cardholderName"] as? String)!
        patientPaymentDetails.cvv = (fbPatientPaymentDetailsData["cvv"] as? Int64)!
        patientPaymentDetails.expirationMM = (fbPatientPaymentDetailsData["expirationMM"] as? Int64)!
        patientPaymentDetails.expirationYY = (fbPatientPaymentDetailsData["expirationYY"] as? Int64)!
        patientPaymentDetails.paymentCardNumber = (fbPatientPaymentDetailsData["paymentCardNumber"] as? Int64)!
        patientPaymentDetails.paymentType = (fbPatientPaymentDetailsData["paymentType"] as? String)!
        
        patientPaymentDetails.objectWillChange.send()
        
        print(patientPaymentDetails)
        
        do {
            
            //            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
            //            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
            //            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            //            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
            //            try persistentContainer.viewContext.execute(deleteRequest)
            try context.save()
            
            //New code after bug on ipad vs iphone
            patientPaymentDetails.objectWillChange.send()
            
        } catch(let error) {
            print("couldn't save patient update to CoreData: \(error.localizedDescription)")
        }
        
    }
}
