//
//  FormSubmissionHelper.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/20/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//
//





import SwiftUI
import CoreData


func FormSubmissionToCoreData(context: NSManagedObjectContext) {
    
    //Save Data into User Defaults

    
    
    //Store User Defaults data into Core Data

    PatientObjectUpdate(context: context)
    PatientHealthDetailsObjectUpdate(context: context)
    PatientInsuranceDetailsObjectUpdate(context: context)
    PatientPaymentDetailsObjectUpdate(context: context)
    
    //Validate that all user defaults data is now in Core Data

    
    
    print("Form Submission Completed!")

}

func PatientObjectUpdate(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<Patient>(entityName: "Patient")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patient = results.first ?? Patient(context: context)

    patient.emailAddress = UserDefaults.standard.string(forKey: "email")
    patient.selectedPharmacy = UserDefaults.standard.string(forKey: "chosenPharmacy")
    patient.fullName = UserDefaults.standard.string(forKey: "fullName")
    patient.address = UserDefaults.standard.string(forKey: "address")
    patient.city = UserDefaults.standard.string(forKey: "city")
    patient.province = UserDefaults.standard.string(forKey: "province")
    patient.postalCode = UserDefaults.standard.string(forKey: "postalCode")
    patient.phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber")

    patient.privacyCompletionFlag = UserDefaults.standard.bool(forKey: "privacyCompletionFlag")
    patient.signupCompletionFlag = UserDefaults.standard.bool(forKey: "signupCompletionFlag")

    patient.objectWillChange.send()

    //One to One Relationships
    patient.healthInfo.objectWillChange.send()
    patient.insuranceInfo.objectWillChange.send()
    patient.paymentInfo.objectWillChange.send()
    patient.shippingInfo.objectWillChange.send()

    //One to Many Relationships
    patient.orderHistory.forEach { $0.objectWillChange.send() }
    patient.orderPharmacy.forEach { $0.objectWillChange.send() }
    
}

func PatientHealthDetailsObjectUpdate(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientHealthDetails>(entityName: "PatientHealthDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientHealthDetails = results.first ?? PatientHealthDetails(context: context)

    patientHealthDetails.birthDate = Int64(UserDefaults.standard.integer(forKey: "birthDate"))
    patientHealthDetails.genericSubstitution = UserDefaults.standard.bool(forKey: "substituteGender")
    patientHealthDetails.gender = UserDefaults.standard.string(forKey: "selectedGender")
    
    patientHealthDetails.allergiesFlag = UserDefaults.standard.bool(forKey: "allergiesFlag")
    patientHealthDetails.specificAllergies = UserDefaults.standard.string(forKey: "otherAllergies")
    
    patientHealthDetails.medicalConditionsFlag = UserDefaults.standard.bool(forKey: "medicalConditionsFlag")
    patientHealthDetails.specificMedicalConditions = UserDefaults.standard.string(forKey: "otherMedicalConditions")

    patientHealthDetails.objectWillChange.send()

    //One to One Relationships
    patientHealthDetails.patient.objectWillChange.send()

    //One to Many Relationships
}
 
func PatientInsuranceDetailsObjectUpdate(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientInsuranceDetails>(entityName: "PatientInsuranceDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientInsuranceDetails = results.first ?? PatientInsuranceDetails(context: context)

    patientInsuranceDetails.ohip = Int64(UserDefaults.standard.integer(forKey: "OHIP"))
    patientInsuranceDetails.billToInsuranceFlag1 = UserDefaults.standard.bool(forKey: "billToInsuranceFlag1")
    patientInsuranceDetails.billToInsuranceFlag2 = UserDefaults.standard.bool(forKey: "billToInsuranceFlag2")
    patientInsuranceDetails.billToInsuranceFlag3 = UserDefaults.standard.bool(forKey: "billToInsuranceFlag3")
    patientInsuranceDetails.planName1 = UserDefaults.standard.string(forKey: "selectedPlanName1")
    patientInsuranceDetails.planName2 = UserDefaults.standard.string(forKey: "selectedPlanName2")
    patientInsuranceDetails.planName3 = UserDefaults.standard.string(forKey: "selectedPlanName3")
    
    patientInsuranceDetails.memberIDNumber1 = Int64(UserDefaults.standard.integer(forKey: "memberID1"))
    patientInsuranceDetails.memberIDNumber2 = Int64(UserDefaults.standard.integer(forKey: "memberID2"))
    patientInsuranceDetails.memberIDNumber3 = Int64(UserDefaults.standard.integer(forKey: "memberID3"))
    patientInsuranceDetails.groupNumber1 = Int64(UserDefaults.standard.integer(forKey: "groupNumber1"))
    patientInsuranceDetails.groupNumber2 = Int64(UserDefaults.standard.integer(forKey: "groupNumber2"))
    patientInsuranceDetails.groupNumber3 = Int64(UserDefaults.standard.integer(forKey: "groupNumber3"))
    patientInsuranceDetails.policyholderName1 = UserDefaults.standard.string(forKey: "policyholderName1")
    patientInsuranceDetails.policyholderName2 = UserDefaults.standard.string(forKey: "policyholderName2")
    patientInsuranceDetails.policyholderName3 = UserDefaults.standard.string(forKey: "policyholderName3")
    patientInsuranceDetails.carrierCode1 = UserDefaults.standard.string(forKey: "carrierCode1")
    patientInsuranceDetails.carrierCode2 = UserDefaults.standard.string(forKey: "carrierCode2")
    patientInsuranceDetails.carrierCode3 = UserDefaults.standard.string(forKey: "carrierCode3")
    patientInsuranceDetails.policyholderDOB1 = Int64(UserDefaults.standard.integer(forKey: "selectedDate1"))
    patientInsuranceDetails.policyholderDOB2 = Int64(UserDefaults.standard.integer(forKey: "selectedDate2"))
    patientInsuranceDetails.policyholderDOB3 = Int64(UserDefaults.standard.integer(forKey: "selectedDate3"))
    patientInsuranceDetails.insurancePhoneNumber1 = Int64(UserDefaults.standard.integer(forKey: "insurancePhone1"))
    patientInsuranceDetails.insurancePhoneNumber2 = Int64(UserDefaults.standard.integer(forKey: "insurancePhone2"))
    patientInsuranceDetails.insurancePhoneNumber3 = Int64(UserDefaults.standard.integer(forKey: "insurancePhone3"))
    patientInsuranceDetails.relationshipToCardholder1 = UserDefaults.standard.string(forKey: "relationshipToCardholder1")
    patientInsuranceDetails.relationshipToCardholder2 = UserDefaults.standard.string(forKey: "relationshipToCardholder2")
    patientInsuranceDetails.relationshipToCardholder3 = UserDefaults.standard.string(forKey: "relationshipToCardholder3")
    
    patientInsuranceDetails.objectWillChange.send()

    //One to One Relationships
    patientInsuranceDetails.patient.objectWillChange.send()

    //One to Many Relationships
    
}

func PatientPaymentDetailsObjectUpdate(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientPaymentDetails>(entityName: "PatientPaymentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientPaymentDetails = results.first ?? PatientPaymentDetails(context: context)

    patientPaymentDetails.paymentType = UserDefaults.standard.string(forKey: "paymentType")
    patientPaymentDetails.cardholderName = UserDefaults.standard.string(forKey: "cardholderName")
    patientPaymentDetails.paymentCardNumber = Int64(UserDefaults.standard.integer(forKey: "paymentCardNumber"))
    patientPaymentDetails.expirationMM = Int64(UserDefaults.standard.integer(forKey: "expirationMonth"))
    patientPaymentDetails.expirationYY = Int64(UserDefaults.standard.integer(forKey: "expirationYear"))
    patientPaymentDetails.cvv = Int64(UserDefaults.standard.integer(forKey: "cvv"))

    patientPaymentDetails.objectWillChange.send()

    //One to One Relationships
    patientPaymentDetails.patient.objectWillChange.send()

    //One to Many Relationships
    
}
