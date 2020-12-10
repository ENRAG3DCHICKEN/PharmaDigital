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
