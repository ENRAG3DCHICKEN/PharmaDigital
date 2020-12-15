//
//  Ext+PatientHealthDetails.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/19/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//


import SwiftUI
import CoreData
import Combine
import UIKit
import FirebaseAuth

//PatientHealthDetails Core Data, Optional Value Check
extension PatientHealthDetails {
    
    //Attributes
    var allergiesFlag: Bool {
        get { allergiesFlag_ }
        set { allergiesFlag_ = newValue }
    }
    var birthDate: String {
        get { birthDate_! }
        set { birthDate_ = newValue }
    }
    var gender: String {
        get { gender_! }
        set { gender_ = newValue }
    }
    var genericSubstitution: Bool {
        get { genericSubstitution_ }
        set { genericSubstitution_ = newValue }
    }
    var medicalConditionsFlag: Bool {
        get { medicalConditionsFlag_ }
        set { medicalConditionsFlag_ = newValue }
    }
    var specificAllergies: String {
        get { specificAllergies_! }
        set { specificAllergies_ = newValue }
    }
    var specificMedicalConditions: String {
        get { specificMedicalConditions_! }
        set { specificMedicalConditions_ = newValue }
    }
    
    //One to One Relationships
    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
    //One to Many Relationships

}

extension PatientHealthDetails {
    
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<PatientHealthDetails> {
        let request = NSFetchRequest<PatientHealthDetails>(entityName: "PatientHealthDetails")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "gender_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
     static func update(fbPatientHealthDetailsData: Dictionary<String,Any>, in context: NSManagedObjectContext, patient: Patient) {

        //Setup NSFetchRequest variable using the same authUID as Firebase
        let request = fetchRequest(NSPredicate(format: "patient_ = %@", patient))
                                       
        print("A")
        print(request)

            let results = (try? context.fetch(request)) ?? []
        print("B")
        print(results)
        
        let patientHealthDetails = results.first ?? PatientHealthDetails(context: context)
        print("C")
        print(patientHealthDetails)
        
        //If patientHealthDetails exists, update existing patientHealthDetails in core data - else if pharmacy doesn't exist, create & populate!
        patientHealthDetails.allergiesFlag = (fbPatientHealthDetailsData["allergiesFlag"] as? Bool)!
        patientHealthDetails.birthDate = (fbPatientHealthDetailsData["birthDate"] as? String)!
        patientHealthDetails.gender = (fbPatientHealthDetailsData["gender"] as? String)!
        patientHealthDetails.genericSubstitution = (fbPatientHealthDetailsData["genericSubstitution"] as? Bool)!
        patientHealthDetails.medicalConditionsFlag = (fbPatientHealthDetailsData["medicalConditionsFlag"] as? Bool)!
        patientHealthDetails.specificAllergies = (fbPatientHealthDetailsData["specificAllergies"] as? String)!
        patientHealthDetails.specificMedicalConditions = (fbPatientHealthDetailsData["specificMedicalConditions"] as? String)!

        patientHealthDetails.objectWillChange.send()
                
        print(patientHealthDetails)
    
        do {
            
//            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//            try persistentContainer.viewContext.execute(deleteRequest)
            try context.save()
            
            //New code after bug on ipad vs iphone
            patientHealthDetails.objectWillChange.send()
            
        } catch(let error) {
            print("couldn't save patient update to CoreData: \(error.localizedDescription)")
        }
     
    }
}

