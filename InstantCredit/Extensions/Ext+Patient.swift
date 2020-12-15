//
//  Ext+Patient.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/18/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData
import Combine
import UIKit
import FirebaseAuth


//Make Patient both identifiable and comporable


//Patient Core Data, Optional Value Check
extension Patient {
    
    //Attributes
    var address: String {
        get { address_! }
        set { address_ = newValue }
    }
    var city: String {
        get { city_! }
        set { city_ = newValue }
    }
    var emailAddress: String {
        get { emailAddress_! }
        set { emailAddress_ = newValue }
    }
    var fullName: String {
        get { fullName_! }
        set { fullName_ = newValue }
    }
    var patientUUID: String {
        get { patientUUID_! }
        set { patientUUID_ = newValue }
    }
    var phoneNumber: String {
        get { phoneNumber_! }
        set { phoneNumber_ = newValue }
    }
    var postalCode: String {
        get { postalCode_! }
        set { postalCode_ = newValue }
    }
    var privacyCompletionFlag: Bool {
        get { privacyCompletionFlag_ }
        set { privacyCompletionFlag_ = newValue }
    }
    var province: String {
        get { province_! }
        set { province_ = newValue }
    }
    var signupCompletionFlag: Bool {
        get { signupCompletionFlag_ }
        set { signupCompletionFlag_ = newValue }
    }
        
    //One to One Relationships
    var healthInfo: PatientHealthDetails {
        get { healthInfo_! }
        set { healthInfo_ = newValue }
    }
    var insuranceInfo: PatientInsuranceDetails {
        get { insuranceInfo_!}
        set { insuranceInfo_ = newValue }
    }
    var paymentInfo: PatientPaymentDetails {
        get { paymentInfo_! }
        set { paymentInfo_ = newValue }
    }
    var shippingInfo: PatientFulfillmentDetails {
        get { shippingInfo_! }
        set { shippingInfo_ = newValue }
    }

    //One to Many Relationships
    var orderHistory: Set<Orders> {
        get { (orderHistory_ as? Set<Orders>) ?? [] }
        set { orderHistory_ = newValue as NSSet }
    }
    var orderPharmacy: Set<Pharmacy> {
        get { (orderPharmacy_ as? Set<Pharmacy>) ?? [] }
        set { orderPharmacy_ = newValue as NSSet }
    }
    
}


extension Patient {
    
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Patient> {
        let request = NSFetchRequest<Patient>(entityName: "Patient")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "emailAddress_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func updateWithRelationships(fbPatientData: Dictionary<String,Any>, in context: NSManagedObjectContext) {

        //Retrieve the FirebaseAuth - User.UID
        let user = Auth.auth().currentUser
        let uid: String = String(user!.uid)
        
        //Setup NSFetchRequest variable using the same authUID as Firebase
        let request = fetchRequest(NSPredicate(format: "patientUUID_ = %@", uid))
                                       
        print("A")
        print(request)
            //Retrieve all Core Data records with the same PharmacyUUID (same as Firebase - using the NSFetchRequest variable setup in the line directly above)
            let results = (try? context.fetch(request)) ?? []
        print("B")
        print(results)
        
        let patient = results.first ?? Patient(context: context)
        print("C")
        print(patient)
        
        //If pharmacy exists, update existing pharmacy in core data - else if pharmacy doesn't exist, create & populate!
        patient.address = (fbPatientData["address"] as? String)!
        patient.city = (fbPatientData["city"] as? String)!
        patient.emailAddress = (fbPatientData["emailAddress"] as? String)!
        patient.fullName = (fbPatientData["fullName"] as? String)!
        patient.patientUUID = (fbPatientData["patientUUID"] as? String)!
        patient.phoneNumber = (fbPatientData["phoneNumber"] as? String)!
        patient.postalCode = (fbPatientData["postalCode"] as? String)!
        patient.privacyCompletionFlag = (fbPatientData["privacyCompletionFlag"] as? Bool)!
        patient.province = (fbPatientData["province"] as? String)!
        patient.signupCompletionFlag = (fbPatientData["signupCompletionFlag"] as? Bool)!
                
        patient.objectWillChange.send()
                
        print(patient)
    
        do {
            
//            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//            try persistentContainer.viewContext.execute(deleteRequest)
            try context.save()
            
            //New code after bug on ipad vs iphone
            patient.objectWillChange.send()
            
        } catch(let error) {
            print("couldn't save patient update to CoreData: \(error.localizedDescription)")
        }
        
        populateCoreData_PatientHealthDetails(context: context, patient: patient)
        populateCoreData_PatientInsuranceDetails(context: context, patient: patient)
        populateCoreData_PatientPaymentDetails(context: context, patient: patient)
        populateCoreData_PatientFulfillmentDetails(context: context, patient: patient)
        
        
        
        //Relationships will Change

//            //One to One Relationships
//            patient.healthInfo.objectWillChange.send()
//            patient.insuranceInfo.objectWillChange.send()
//            patient.paymentInfo.objectWillChange.send()
//
//            //One to Many Relationships
//            patient.orderHistory.forEach { $0.objectWillChange.send() }
//            patient.orderPharmacy.forEach { $0.objectWillChange.send() }
        

//            patientHealthDetails.objectWillChange.send()
//            patientInsuranceDetails.objectWillChange.send()
//            patientPaymentDetails.objectWillChange.send()
//            patientFulfillmentDetails.objectWillChange.send()


//        let patient: Patient = PatientObjectUpdate(context: context)
//        let patientHealthDetails: PatientHealthDetails = PatientHealthDetailsObjectUpdate(context: context, patient: patient)
//        let patientInsuranceDetails: PatientInsuranceDetails = PatientInsuranceDetailsObjectUpdate(context: context, patient: patient)
//        let patientPaymentDetails: PatientPaymentDetails = PatientPaymentDetailsObjectUpdate(context: context, patient: patient)
//
//        groupedObjectsWillChange(context: context, patient: patient, patientHealthDetails: patientHealthDetails, patientInsuranceDetails: patientInsuranceDetails, patientPaymentDetails: patientPaymentDetails)
        
        
        
        
        
    }
}

