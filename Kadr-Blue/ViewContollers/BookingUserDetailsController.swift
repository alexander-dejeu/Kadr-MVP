//
//  BookingUserDetailsController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class BookingUserDetailsController: UIViewController, UITextFieldDelegate, STPPaymentContextDelegate {
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userPhoneNumberView: UIView!
    @IBOutlet weak var userPhototCountView: UIView!
    
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var userPhoneNumberTextfield: UITextField!
    
    @IBOutlet weak var userPhotoCountTextfield: UITextField!
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(BookTimeAndPlaceController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BookTimeAndPlaceController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookTimeAndPlaceController.hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
        
        self.userNameTextfield.delegate = self
        self.userPhoneNumberTextfield.delegate = self
        self.userPhotoCountTextfield.delegate = self

        
        self.title = "Information"
        // Do any additional setup after loading the view.
        UIHelper.addCornersTo(view: userNameView)
        UIHelper.addCornersTo(view: userPhoneNumberView)
        UIHelper.addCornersTo(view: userPhototCountView)
            UIHelper.addCornersTo(view: bookButton)
        
        // Here, MyAPIAdapter is your class that implements STPBackendAPIAdapter (see above)
        self.paymentContext = STPPaymentContext(apiAdapter: MyAPIAdapter())
        super.init(nibName: nil, bundle: nil)
        self.paymentContext.delegate = self
        self.paymentContext.hostViewController = self
        self.paymentContext.paymentAmount = 5000 // Measured in cents, i.e. $50 USD

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* MARK: - STRIPE  */
    func paymentContextDidChange(paymentContext: STPPaymentContext) {
        self.activityIndicator.animating = paymentContext.loading
        self.paymentButton.enabled = paymentContext.selectedPaymentMethod != nil
        self.paymentLabel.text = paymentContext.selectedPaymentMethod?.label
        self.paymentIcon.image = paymentContext.selectedPaymentMethod?.image
    }
    
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didCreatePaymentResult paymentResult: STPPaymentResult,
                        completion: STPErrorBlock) {
        
        myAPIClient.createCharge(paymentResult.source.stripeID, completion: { (error: NSError?) in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        })
    }
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didFinishWithStatus status: STPPaymentStatus,
                        error: NSError?) {
        
        switch status {
        case .Error:
            self.showError(error)
        case .Success:
            self.showReceipt()
        case .UserCancellation:
            return // Do nothing
        }
    }
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didFailToLoadWithError error: NSError) {
        self.navigationController?.popViewControllerAnimated(true)
        // Show the error to your user, etc.
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
        self.paymentContext.requestPayment()
        self.performSegue(withIdentifier: "segueFromUserInformationToBookingConfirmation", sender: nil)
    }

}

extension BookingUserDetailsController {
    

    func keyboardWillShow(notification: NSNotification) {
        
        if  userPhotoCountTextfield.isFirstResponder == true {
            
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
            
        }
        
        
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}

