//
//  Ext+Orders.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-12-06.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

extension Orders {
    
    //Standard query request to Core Data
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Orders> {
        let request = NSFetchRequest<Orders>(entityName: "Orders")
        // need to sort by distance
        request.sortDescriptors = [NSSortDescriptor(key: "orderSubmissionTime", ascending: true)]
        request.predicate = predicate
        return request
    }

}
