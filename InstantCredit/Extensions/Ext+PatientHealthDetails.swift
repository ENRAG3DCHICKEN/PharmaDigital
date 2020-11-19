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

extension PatientHealthDetails {

    
    var emailAddress: String {
        get { emailAddress_! } // TODO: maybe protect against when app ships?
        set { emailAddress_ = newValue }
    }
    
    public var id: String { emailAddress }

}
