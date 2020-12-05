//
//  OrderSubmissionView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-04.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//



import SwiftUI
import CoreData


func OrderSubmissionToCoreData(context: NSManagedObjectContext, indicator: Int) {

    //Standard query request to Core Data
    let request = NSFetchRequest<PatientFulfillmentDetails>(entityName: "PatientFulfillmentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)
    
    let patientFulfillmentDetails: PatientFulfillmentDetails = PatientFulfillmentDetailsObjectUpdate(context: context)
    let orders: Orders = OrdersObjectUpdate(context: context)
    
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

func OrdersObjectUpdate(context: NSManagedObjectContext) -> Orders {
    
    let orders = Orders(context: context)
    
//    patientFulfillmentDetails.address = UserDefaults.standard.string(forKey: "shipAddress")
//    patientFulfillmentDetails.city = UserDefaults.standard.string(forKey: "shipCity")
//    patientFulfillmentDetails.emailAddress = UserDefaults.standard.string(forKey: "email")
//    patientFulfillmentDetails.fullName = UserDefaults.standard.string(forKey: "shipFullName")
//    patientFulfillmentDetails.postalCode = UserDefaults.standard.string(forKey: "shipPostalCode")
//    patientFulfillmentDetails.province = UserDefaults.standard.string(forKey: "shipProvince")
//    patientFulfillmentDetails.phoneNumber = UserDefaults.standard.string(forKey: "shipPhoneNumber")

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
