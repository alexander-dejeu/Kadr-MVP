//
//  FirebaseHelper.swift
//  Kadr-Blue
//
//  Created by Ilia Tikhomirov on 20/10/2016.
//  Copyright © 2016 Kadr. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseHelper {
    
    static let sharedInstance = FirebaseHelper()
    
    var ref: FIRDatabaseReference!
    var bookingsRef: FIRDatabaseReference!
    let userID = FIRAuth.auth()?.currentUser?.uid
    
    func saveToFireBase(time: String, place: String, name: String, phone: String, number: Int) {
        ref = FIRDatabase.database().reference()
        
        
        self.ref.child("bookings").child(userID!).child("time").setValue(time)
        self.ref.child("bookings").child(userID!).child("place").setValue(place)
        self.ref.child("bookings").child(userID!).child("name").setValue(name)
        self.ref.child("bookings").child(userID!).child("phone").setValue(phone)
        self.ref.child("bookings").child(userID!).child("number").setValue(number)
        self.ref.child("bookings").child(userID!).child("ID").setValue(userID!)
        
    }
    
    func loginWithFirebase() {
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            print(user?.uid)
            print(error)
        }
    }
    
    func checkExistingBooking(completion: @escaping (Bool) -> Void)  {
        
        bookingsRef = FIRDatabase.database().reference().child("bookings")
        
        bookingsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print(snapshot.value)
            completion(snapshot.childSnapshot(forPath: self.userID!).exists())
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}

