//
//  FormSubmissionHelper.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/20/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//
//





//import SwiftUI
//import CoreData
//
//
//
//func updateCoreDataFromUserDefaults() {
//    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
//
//    //Save Data into User Defaults
//
//    //Store User Defaults data into Core Data
//
//        //Standard query request to Core Data
//        let request = NSFetchRequest<Patient>(entityName: "Patient")
//        request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
//        request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)
//
//        let results = (try? context.fetch(request)) ?? []
//        let patient = results.first ?? Patient(context: context)
//
//        patient.emailAddress = UserDefaults.standard.string(forKey: "email")!
//        patient.selectedPharmacy = chosenPharmacy!.pharmacyName
//        patient.fullName = fullName
//        patient.address = address
//        patient.city = city
//        patient.province = province
//        patient.postalCode = postalCode
//        patient.phoneNumber = phoneNumber
//
//
//        patient.objectWillChange.send()
//
//        //One to One Relationships
//                        patient.healthInfo.objectWillChange.send()
//                        patient.insuranceInfo.objectWillChange.send()
//                        patient.paymentInfo.objectWillChange.send()
//                        patient.shippingInfo.objectWillChange.send()
//
//        //One to Many Relationships
//        patient.orderHistory.forEach { $0.objectWillChange.send() }
//        patient.orderPharmacy.forEach { $0.objectWillChange.send() }
//
//
//
//        let request = NSFetchRequest<PatientHealthDetails>(entityName: "PatientHealthDetails")
//        request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
//        request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)
//
//        let results = (try? context.fetch(request)) ?? []
//        let patientHealthDetails = results.first ?? PatientHealthDetails(context: context)
//        print("///////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
//        print(selectedDate.description)
//    //                        patientHealthDetails.dobDD = Int64(selectedDate)
//    //                        patientHealthDetails.dobMM = fullName
//    //                        patientHealthDetails.dobYY = fullName
//
//        patientHealthDetails.emailAddress = UserDefaults.standard.string(forKey: "email")!
//        patientHealthDetails.genericSubstitution = substituteGeneric
//        patientHealthDetails.gender = selectedGender
//
//
//
//        patientHealthDetails.objectWillChange.send()
//
//
//    //Validate that all user defaults data is now in Core Data
//
//
//
//}
