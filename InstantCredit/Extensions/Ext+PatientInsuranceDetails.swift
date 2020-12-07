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

extension PatientInsuranceDetails {

    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
}
    
