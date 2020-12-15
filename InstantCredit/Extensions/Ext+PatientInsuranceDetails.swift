//
//  Ext+PatientInsuranceDetails.swift
//  
//
//  Created by ENRAG3DCHICKEN on 2020-12-06.
//

import SwiftUI
import CoreData
import Combine
import UIKit

//PatientInsuranceDetails Core Data, Optional Value Check
extension PatientInsuranceDetails {
    
    //Attributes
    
    //One to One Relationships
    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
    //One to Many Relationships

}

extension PatientInsuranceDetails {
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<PatientInsuranceDetails> {
        let request = NSFetchRequest<PatientInsuranceDetails>(entityName: "PatientInsuranceDetails")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "ohip", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func update(fbPatientInsuranceDetailsData: Dictionary<String,Any>, in context: NSManagedObjectContext, patient: Patient) {

       //Setup NSFetchRequest variable using the same authUID as Firebase
       let request = fetchRequest(NSPredicate(format: "patient_ = %@", patient))
                                      
       print("A")
       print(request)

           let results = (try? context.fetch(request)) ?? []
       print("B")
       print(results)
       
       let patientInsuranceDetails = results.first ?? PatientInsuranceDetails(context: context)
       print("C")
       print(patientInsuranceDetails)
       
       //If patientInsuranceDetails exists, update existing patientInsuranceDetails in core data - else if pharmacy doesn't exist, create & populate!
        patientInsuranceDetails.billToInsuranceFlag1 = (fbPatientInsuranceDetailsData["billToInsuranceFlag1"] as? Bool) 
        patientInsuranceDetails.billToInsuranceFlag2 = (fbPatientInsuranceDetailsData["billToInsuranceFlag2"] as? Bool)
        patientInsuranceDetails.billToInsuranceFlag3 = (fbPatientInsuranceDetailsData["billToInsuranceFlag3"] as? Bool)
        patientInsuranceDetails.carrierCode1 = (fbPatientInsuranceDetailsData["carrierCode1"] as? String)
        patientInsuranceDetails.carrierCode2 = (fbPatientInsuranceDetailsData["carrierCode2"] as? String)
        patientInsuranceDetails.carrierCode3 = (fbPatientInsuranceDetailsData["carrierCode3"] as? String)
        patientInsuranceDetails.emailAddress = (fbPatientInsuranceDetailsData["emailAddress"] as? String)
        patientInsuranceDetails.groupNumber1 = (fbPatientInsuranceDetailsData["groupNumber1"] as? Int64)
        patientInsuranceDetails.groupNumber2 = (fbPatientInsuranceDetailsData["groupNumber2"] as? Int64)
        patientInsuranceDetails.groupNumber3 = (fbPatientInsuranceDetailsData["groupNumber3"] as? Int64)
        patientInsuranceDetails.insurancePhoneNumber1 = (fbPatientInsuranceDetailsData["insurancePhoneNumber1"] as? Int64)
        patientInsuranceDetails.insurancePhoneNumber2 = (fbPatientInsuranceDetailsData["insurancePhoneNumber2"] as? Int64)
        patientInsuranceDetails.insurancePhoneNumber3 = (fbPatientInsuranceDetailsData["insurancePhoneNumber3"] as? Int64)
        patientInsuranceDetails.memberIDNumber1 = (fbPatientInsuranceDetailsData["memberIDNumber1"] as? Int64)
        patientInsuranceDetails.memberIDNumber2 = (fbPatientInsuranceDetailsData["memberIDNumber2"] as? Int64)
        patientInsuranceDetails.memberIDNumber3 = (fbPatientInsuranceDetailsData["memberIDNumber3"] as? Int64)
        patientInsuranceDetails.ohip = (fbPatientInsuranceDetailsData["ohip"] as? Int64)
        patientInsuranceDetails.planName1 = (fbPatientInsuranceDetailsData["planName1"] as? String)
        patientInsuranceDetails.planName2 = (fbPatientInsuranceDetailsData["planName2"] as? String)
        patientInsuranceDetails.planName3 = (fbPatientInsuranceDetailsData["planName3"] as? String)
        patientInsuranceDetails.policyholderDOB1 = (fbPatientInsuranceDetailsData["policyholderDOB1"] as? Int64)
        patientInsuranceDetails.policyholderDOB2 = (fbPatientInsuranceDetailsData["policyholderDOB2"] as? Int64)
        patientInsuranceDetails.policyholderDOB3 = (fbPatientInsuranceDetailsData["policyholderDOB3"] as? Int64)
        patientInsuranceDetails.policyholderName1 = (fbPatientInsuranceDetailsData["policyholderName1"] as? String)
        patientInsuranceDetails.policyholderName2 = (fbPatientInsuranceDetailsData["policyholderName2"] as? String)
        patientInsuranceDetails.policyholderName3 = (fbPatientInsuranceDetailsData["policyholderName3"] as? String)
        patientInsuranceDetails.relationshipToCardholder1 = (fbPatientInsuranceDetailsData["relationshipToCardholder1"] as? String)
        patientInsuranceDetails.relationshipToCardholder2 = (fbPatientInsuranceDetailsData["relationshipToCardholder2"] as? String)
        patientInsuranceDetails.relationshipToCardholder3 = (fbPatientInsuranceDetailsData["relationshipToCardholder3"] as? String)
    
       patientInsuranceDetails.objectWillChange.send()
               
       print(patientInsuranceDetails)
   
       do {
           
//            Code for debugging - allows you to delete all the individual records and fields from an entity - everything in Pharmacy while leaving pharmacy intact
//            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Pharmacy.fetchRequest()
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//            try persistentContainer.viewContext.execute(deleteRequest)
           try context.save()
           
           //New code after bug on ipad vs iphone
           patientInsuranceDetails.objectWillChange.send()
           
       } catch(let error) {
           print("couldn't save patient update to CoreData: \(error.localizedDescription)")
       }
    
   }
    
}
