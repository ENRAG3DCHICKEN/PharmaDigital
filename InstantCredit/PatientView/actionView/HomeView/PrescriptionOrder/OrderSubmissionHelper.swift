//
//  OrderSubmissionView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-04.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//



import SwiftUI
import CoreData
import Firebase


func OrderSubmissionToCoreDataAndFB(context: NSManagedObjectContext, chosenPharmacy: Pharmacy, prescriptionSource: String?, indicator: Int) {

    //Standard query request to Core Data
    let request = NSFetchRequest<PatientFulfillmentDetails>(entityName: "PatientFulfillmentDetails")
    request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
    request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)
    
    let patientFulfillmentDetails: PatientFulfillmentDetails = PatientFulfillmentDetailsObjectUpdate(context: context)
    let orders: Orders = OrdersObjectUpdate(context: context, chosenPharmacy: chosenPharmacy, prescriptionSource: prescriptionSource, indicator: indicator)
    groupedObjectsWillChange_Orders(context: context, patientFulfillmentDetails: patientFulfillmentDetails, orders: orders)
    print("Core Data Order Submission Completed!")

    SendOrdersToFirestore(orders: orders)
    
    ClearOrderRelatedUserDefaults()

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

func OrdersObjectUpdate(context: NSManagedObjectContext, chosenPharmacy: Pharmacy, prescriptionSource: String?, indicator: Int) -> Orders {
    
    let orders = Orders(context: context)
    
    orders.orderCompleted = false
    orders.orderUUID = UUID()
    orders.pharmacyName = chosenPharmacy.pharmacyName
    orders.pharmacyAccreditationNumber = chosenPharmacy.accreditationNumber
    orders.pharmacyEmailAddress = chosenPharmacy.emailAddress
    
    //Back to New Prescriptions
    if indicator == 2 {
        orders.orderType = "New Prescription"
        orders.prescriptionSource = prescriptionSource
    //Back to Refill Prescriptions
    } else if indicator == 3 {
        orders.orderType = "Refill Prescription"
        orders.prescriptionSource = prescriptionSource
    //Back to Transfer Prescriptions
    } else if indicator == 4 {
        orders.orderType = "Tramsfer Prescription"
        orders.prescriptionSource = prescriptionSource
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

func SendOrdersToFirestore(orders: Orders) {
    
    //Populate Core Data asynchronously on secondary queue
    DispatchQueue.global(qos: .userInitiated).async {
        
        //Search firebase for documents = pharmacies
        let db = Firestore.firestore()
        
        // Add a new document in collection "cities"
        db.collection("orders").document((orders.orderUUID)!.uuidString).setData([
            "orderCompleted": orders.orderCompleted,
            "orderType": orders.orderType!,
            "orderUUID": ((orders.orderUUID)?.uuidString)!,
            "pharmacyAccreditationNumber": orders.pharmacyAccreditationNumber,
            "pharmacyName": orders.pharmacyName!,
            "pharmacyEmailAddress": orders.pharmacyEmailAddress!,
            "prescriptionSource": orders.prescriptionSource ?? "",
            "refill_prescription": orders.refill_prescription ?? "",
            "trans_prescription": orders.trans_prescription ?? "",
            "trans_priorPharmacyName": orders.trans_priorPharmacyName ?? "",
            "trans_priorPharmacyPhone": orders.trans_priorPharmacyPhone ?? "",
            "trans_transferAll": orders.trans_transferAll,
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}

func ClearOrderRelatedUserDefaults() {

    UserDefaults.standard.removeObject(forKey: "transPriorPharmacyName")
    UserDefaults.standard.removeObject(forKey: "transPriorPharmacyPhone")
    UserDefaults.standard.removeObject(forKey: "transAllFlag")
    
    UserDefaults.standard.removeObject(forKey: "transMedication1")
    UserDefaults.standard.removeObject(forKey: "transMedication2")
    UserDefaults.standard.removeObject(forKey: "transMedication3")
    UserDefaults.standard.removeObject(forKey: "transMedication4")
    UserDefaults.standard.removeObject(forKey: "transMedication5")
    UserDefaults.standard.removeObject(forKey: "transMedication6")
    
}
