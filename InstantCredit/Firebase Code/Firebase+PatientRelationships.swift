//
//  Firebase+Patient.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//


import Foundation
import Firebase
import CoreData
import SwiftUI

//Parent Func - For Asynch Functionality
func populateCoreData_PatientRelationships(context: NSManagedObjectContext) {
    
    //Use the UID to retrieve the user document from Firebase
    
    //Retrieve the FirebaseAuth - User.UID
    let user = Auth.auth().currentUser
    let uid: String = String(user!.uid)

    //Search firebase for documents = pharmacies
    let db = Firestore.firestore()
        
    let docRef = db.collection("users").document(uid)
    docRef.getDocument { (document, error) in
        
        if let document = document, document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
                
            //Pass the document into PatientRelationships Update
            Patient.updateWithRelationships(fbPatientData: document.data()!, in: context)

            } else {
                print("Document does not exist")
            }
    }
}

//Child Func
func populateCoreData_PatientHealthDetails(context: NSManagedObjectContext, patient: Patient) {

    //Retrieve the FirebaseAuth - User.UID
    let user = Auth.auth().currentUser

    let uid: String = String(user!.uid)

    let db = Firestore.firestore()
    
    db.collection("users").document(uid).collection("HealthProfile").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {

                print(document.data())
                PatientHealthDetails.update(fbPatientHealthDetailsData: document.data(), in: context, patient: patient)
            }
        }
    }
}

//Child Func
func populateCoreData_PatientInsuranceDetails(context: NSManagedObjectContext, patient: Patient) {
    
    //Retrieve the FirebaseAuth - User.UID
    let user = Auth.auth().currentUser

    let uid: String = String(user!.uid)

    let db = Firestore.firestore()
    
    db.collection("users").document(uid).collection("InsuranceDetails").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {

                print(document.data())
                PatientInsuranceDetails.update(fbPatientInsuranceDetailsData: document.data(), in: context, patient: patient)
            }
        }
    }
}

//Child Func
func populateCoreData_PatientPaymentDetails(context: NSManagedObjectContext, patient: Patient) {
    
    //Retrieve the FirebaseAuth - User.UID
    let user = Auth.auth().currentUser

    let uid: String = String(user!.uid)

    let db = Firestore.firestore()
    
    db.collection("users").document(uid).collection("PaymentDetails").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {

                print(document.data())
                PatientPaymentDetails.update(fbPatientPaymentDetailsData: document.data(), in: context, patient: patient)
            }
        }
    }
}

//Child Func
func populateCoreData_PatientFulfillmentDetails(context: NSManagedObjectContext, patient: Patient) {

    //Retrieve the FirebaseAuth - User.UID
    let user = Auth.auth().currentUser

    let uid: String = String(user!.uid)

    let db = Firestore.firestore()
    
    db.collection("users").document(uid).collection("ShippingAddress").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {

                print(document.data())
                PatientFulfillmentDetails.update(fbPatientFulfillmentDetailsData: document.data(), in: context, patient: patient)
            }
        }
    }
}




