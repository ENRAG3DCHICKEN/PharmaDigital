//
//  StartViewHelpers.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-11.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import Foundation

func validateFields(email: String, password: String) -> String {
    
    //Check if fields are empty
    if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        return "Please fill in all the fields"
    }
    
    //Check if password is valid (Length = 8, at least 1 character, at least 1 special character)
    if isPasswordValid(password) != true {
        return "Please make sure your password is at least 8 characters & contains a special character and a number."
    }
     
    return "OK"
}

func isPasswordValid(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
}


