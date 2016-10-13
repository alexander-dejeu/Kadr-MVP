//
//  BookingUserDetailsController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class BookingUserDetailsController: UIViewController {
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userPhoneNumberView: UIView!
    @IBOutlet weak var userPhototCountView: UIView!
    
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var userPhoneNumberTextfield: UITextField!
    
    @IBOutlet weak var userPhotoCountTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Information"
        // Do any additional setup after loading the view.
        UIHelper.addCornersTo(view: userNameView)
        UIHelper.addCornersTo(view: userPhoneNumberView)
        UIHelper.addCornersTo(view: userPhototCountView)
            UIHelper.addCornersTo(view: bookButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func bookButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromUserInformationToBookingConfirmation", sender: nil)
    }

}
