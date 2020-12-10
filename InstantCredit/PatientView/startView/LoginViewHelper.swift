//
//  LoginViewHelper.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-09.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

func CallTransferCoreDataToUserDefaults_Patient(context: NSManagedObjectContext) {
    //Standard query request to Core Data
    let request = NSFetchRequest<Patient>(entityName: "Patient")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patient = results.first
    
    UserDefaults.standard.set(patient?.fullName, forKey: "fullName")
    UserDefaults.standard.set(patient?.address, forKey: "address")
    UserDefaults.standard.set(patient?.city, forKey: "city")
    UserDefaults.standard.set(patient?.province, forKey: "province")
    UserDefaults.standard.set(patient?.postalCode, forKey: "postalCode")
    UserDefaults.standard.set(patient?.phoneNumber, forKey: "phoneNumber")
}

func CallTransferCoreDataToUserDefaults_PatientHealthDetails(context: NSManagedObjectContext) {
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientHealthDetails>(entityName: "PatientHealthDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientHealthDetails = results.first

    UserDefaults.standard.set(patientHealthDetails?.birthDate, forKey: "birthDate")
    UserDefaults.standard.set(patientHealthDetails?.genericSubstitution, forKey: "substituteGeneric")
    UserDefaults.standard.set(patientHealthDetails?.gender, forKey: "selectedGender")
    
    UserDefaults.standard.set(patientHealthDetails?.allergiesFlag, forKey: "allergiesFlag")
//    UserDefaults.standard.set(patientHealthDetails?.allerg, forKey: "allergiesListFlag")
//    UserDefaults.standard.set(patientHealthDetails?.otherAllergies, forKey: "otherAllergies")
    
    UserDefaults.standard.set(patientHealthDetails?.medicalConditionsFlag, forKey: "medicalConditionsFlag")
//    UserDefaults.standard.set(patientHealthDetails?.conditionsListFlag, forKey: "conditionsListFlag")
//    UserDefaults.standard.set(patientHealthDetails?.otherMedicalConditions, forKey: "otherMedicalConditions")
}

func CallTransferCoreDataToUserDefaults_PatientInsuranceDetails(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientInsuranceDetails>(entityName: "PatientInsuranceDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientInsuranceDetails = results.first

    UserDefaults.standard.set(patientInsuranceDetails?.ohip, forKey: "OHIP")
    UserDefaults.standard.set(patientInsuranceDetails?.billToInsuranceFlag1, forKey: "billToInsuranceFlag1")
    UserDefaults.standard.set(patientInsuranceDetails?.billToInsuranceFlag2, forKey: "billToInsuranceFlag2")
    UserDefaults.standard.set(patientInsuranceDetails?.billToInsuranceFlag3, forKey: "billToInsuranceFlag3")
    UserDefaults.standard.set(patientInsuranceDetails?.planName1, forKey: "selectedPlanName1")
    UserDefaults.standard.set(patientInsuranceDetails?.planName2, forKey: "selectedPlanName2")
    UserDefaults.standard.set(patientInsuranceDetails?.planName3, forKey: "selectedPlanName3")

    UserDefaults.standard.set(patientInsuranceDetails?.memberIDNumber1, forKey: "memberID1")
    UserDefaults.standard.set(patientInsuranceDetails?.groupNumber1, forKey: "groupNumber1")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderName1, forKey: "policyholderName1")
    UserDefaults.standard.set(patientInsuranceDetails?.carrierCode1, forKey: "carrierCode1")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderDOB1, forKey: "selectedDate1")
    UserDefaults.standard.set(patientInsuranceDetails?.insurancePhoneNumber1, forKey: "insurancePhone1")
    UserDefaults.standard.set(patientInsuranceDetails?.relationshipToCardholder1, forKey: "relationshipToCardholder1")

    UserDefaults.standard.set(patientInsuranceDetails?.memberIDNumber2, forKey: "memberID2")
    UserDefaults.standard.set(patientInsuranceDetails?.groupNumber2, forKey: "groupNumber2")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderName2, forKey: "policyholderName2")
    UserDefaults.standard.set(patientInsuranceDetails?.carrierCode2, forKey: "carrierCode2")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderDOB2, forKey: "selectedDate2")
    UserDefaults.standard.set(patientInsuranceDetails?.insurancePhoneNumber2, forKey: "insurancePhone2")
    UserDefaults.standard.set(patientInsuranceDetails?.relationshipToCardholder2, forKey: "relationshipToCardholder2")

    UserDefaults.standard.set(patientInsuranceDetails?.memberIDNumber3, forKey: "memberID3")
    UserDefaults.standard.set(patientInsuranceDetails?.groupNumber3, forKey: "groupNumber3")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderName3, forKey: "policyholderName3")
    UserDefaults.standard.set(patientInsuranceDetails?.carrierCode3, forKey: "carrierCode3")
    UserDefaults.standard.set(patientInsuranceDetails?.policyholderDOB3, forKey: "selectedDate3")
    UserDefaults.standard.set(patientInsuranceDetails?.insurancePhoneNumber3, forKey: "insurancePhone3")
    UserDefaults.standard.set(patientInsuranceDetails?.relationshipToCardholder3, forKey: "relationshipToCardholder3")
}

func CallTransferCoreDataToUserDefaults_PatientPaymentDetails(context: NSManagedObjectContext) {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientPaymentDetails>(entityName: "PatientPaymentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientPaymentDetails = results.first
    
    UserDefaults.standard.set(patientPaymentDetails?.paymentType, forKey: "paymentType")
    UserDefaults.standard.set(patientPaymentDetails?.cardholderName, forKey: "cardholderName")
    UserDefaults.standard.set(patientPaymentDetails?.paymentCardNumber, forKey: "paymentCardNumber")
    UserDefaults.standard.set(patientPaymentDetails?.expirationMM, forKey: "expirationMonth")
    UserDefaults.standard.set(patientPaymentDetails?.expirationYY, forKey: "expirationYear")
    UserDefaults.standard.set(patientPaymentDetails?.cvv, forKey: "cvv")

}




