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
    var emailAddress: String {
        get { emailAddress_! }
        set { emailAddress_ = newValue }
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
