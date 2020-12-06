//
//  OrderSubmissionView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-04.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//



import SwiftUI
import CoreData


func OrderSubmissionToCoreData(context: NSManagedObjectContext, chosenPharmacy: Pharmacy, indicator: Int) {

    //Standard query request to Core Data
    let request = NSFetchRequest<PatientFulfillmentDetails>(entityName: "PatientFulfillmentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)
    
    let patientFulfillmentDetails: PatientFulfillmentDetails = PatientFulfillmentDetailsObjectUpdate(context: context)
    let orders: Orders = OrdersObjectUpdate(context: context, chosenPharmacy: chosenPharmacy, indicator: indicator)
    
    groupedObjectsWillChange_Orders(context: context, patientFulfillmentDetails: patientFulfillmentDetails, orders: orders)
    
    print("Order Submission Completed!")

}

func PatientFulfillmentDetailsObjectUpdate(context: NSManagedObjectContext) -> PatientFulfillmentDetails {
    
    //Standard query request to Core Data
    let request = NSFetchRequest<PatientFulfillmentDetails>(entityName: "PatientFulfillmentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

    let results = (try? context.fetch(request)) ?? []
    let patientFulfillmentDetails = results.first ?? PatientFulfillmentDetails(context: context)
    
    patientFulfillmentDetails.address = UserDefaults.standard.string(forKey: "shipAddress")
    patientFulfillmentDetails.city = UserDefaults.standard.string(forKey: "shipCity")
    patientFulfillmentDetails.emailAddress = UserDefaults.standard.string(forKey: "email")
    patientFulfillmentDetails.fullName = UserDefaults.standard.string(forKey: "shipFullName")
    patientFulfillmentDetails.postalCode = UserDefaults.standard.string(forKey: "shipPostalCode")
    patientFulfillmentDetails.province = UserDefaults.standard.string(forKey: "shipProvince")
    patientFulfillmentDetails.phoneNumber = UserDefaults.standard.string(forKey: "shipPhoneNumber")
    
    do {
        try context.save()
    } catch(let error) {
        print("couldn't save patient fulfillment details update to CoreData: \(error.localizedDescription)")
    }
    
    return patientFulfillmentDetails
}

func OrdersObjectUpdate(context: NSManagedObjectContext, chosenPharmacy: Pharmacy, indicator: Int) -> Orders {
    
    let orders = Orders(context: context)
    
    orders.orderCompleted = false
    orders.orderUUID = UUID()
    orders.pharmacyName = chosenPharmacy.pharmacyName
    
    //Back to New Prescriptions
    if indicator == 2 {
        orders.orderType = "New Prescription"
    //Back to Refill Prescriptions
    } else if indicator == 3 {
        orders.orderType = "Refill Prescription"
    //Back to Transfer Prescriptions
    } else if indicator == 4 {
        orders.orderType = "Tramsfer Prescription"
        orders.trans_priorPharmacyName = UserDefaults.standard.string(forKey: "transPriorPharmacyName")
        orders.trans_priorPharmacyPhone = UserDefaults.standard.string(forKey: "transPriorPharmacyPhone")
        orders.trans_transferAll = UserDefaults.standard.bool(forKey: "transAllFlag")
        orders.trans_prescription = UserDefaults.standard.string(forKey: "transMedication1")! + UserDefaults.standard.string(forKey: "transMedication2")! + UserDefaults.standard.string(forKey: "transMedication3")! + UserDefaults.standard.string(forKey: "transMedication4")! + UserDefaults.standard.string(forKey: "transMedication5")! + UserDefaults.standard.string(forKey: "transMedication6")!
    }
    
    
    
    
    do {
        try context.save()
    } catch(let error) {
        print("couldn't save orders update to CoreData: \(error.localizedDescription)")
    }

    return orders
}



func groupedObjectsWillChange_Orders(context: NSManagedObjectContext, patientFulfillmentDetails: PatientFulfillmentDetails, orders: Orders) {

        //PatientFulfillmentDetails
        patientFulfillmentDetails.objectWillChange.send()
        
        //Orders
        orders.objectWillChange.send()

        do {
            try context.save()
        } catch(let error) {
            print("couldn't save patient fulfillment details update to CoreData: \(error.localizedDescription)")
        }

}
