//
//  UserInputHelper.swift
//  Kadr-Blue
//
//  Created by Ilia Tikhomirov on 20/10/2016.
//  Copyright © 2016 Kadr. All rights reserved.
//

import Foundation

class UserInputHelper {
    
    static let sharedInstance = UserInputHelper()
    
    var dateAndTime: String? = nil
    var place: String? = nil
    var name: String? = nil
    var phone: String? = nil
    var number: Int? = nil
    
    func saveBookingRequest() {
        
        FirebaseHelper.sharedInstance.saveToFireBase(time: dateAndTime!, place: place!, name: name!, phone: phone!, number: number!)
        
    }
    
}
