//
//  Ext+PatientPaymentDetails.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-11-28.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//


import SwiftUI
import CoreData
import Combine
import UIKit

extension PatientPaymentDetails {

    var patient: Patient {
        get { patient_! }
        set { patient_ = newValue }
    }
    
}
    
