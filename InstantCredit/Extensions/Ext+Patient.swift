//
//  Ext+Patient.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/18/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData
import Combine
import UIKit

extension Patient {
    
    //One to One Relationships
    var healthInfo: PatientHealthDetails {
        get { healthInfo_! }
        set { healthInfo_ = newValue }
    }
    var insuranceInfo: PatientInsuranceDetails {
        get { insuranceInfo_!}
        set { insuranceInfo_ = newValue }
    }
    var paymentInfo: PatientPaymentDetails {
        get { paymentInfo_! }
        set { paymentInfo_ = newValue }
    }
    var shippingInfo: PatientShippingDetails {
        get { shippingInfo_! }
        set { shippingInfo_ = newValue }
    }

    //One to Many Relationships
    var orderHistory: Set<Orders> {
        get { (orderHistory_ as? Set<Orders>) ?? [] }
        set { orderHistory_ = newValue as NSSet }
    }
    var orderPharmacy: Set<Pharmacy> {
        get { (orderPharmacy_ as? Set<Pharmacy>) ?? [] }
        set { orderPharmacy_ = newValue as NSSet }
    }
    
    public var id: String { emailAddress! }

}
