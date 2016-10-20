//
//  BookTimeAndPlaceController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class BookTimeAndPlaceController: UIViewController {
    
    @IBOutlet weak var dateAndTimeView: UIView!

    @IBOutlet weak var whereView: UIView!
    
    @IBOutlet weak var bookingTimePicker: UIDatePicker!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var locationTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Date and Place".localized
        bookingTimePicker.minimumDate =  Date()
        
        NotificationCenter.default.addObserver(self, selector: #selector(BookTimeAndPlaceController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BookTimeAndPlaceController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookTimeAndPlaceController.hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
        
        UIHelper.addCornersTo(view: whereView)
        UIHelper.addCornersTo(view: dateAndTimeView)
        UIHelper.addCornersTo(view: nextButton)
        // Do any additional setup after loading the view.
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
    
    @IBAction func nextButtonTapped(_ sender: AnyObject) {
        
        let date = bookingTimePicker.date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        let dateStr = formatter.string(from: date)
        
        UserInputHelper.sharedInstance.dateAndTime = String(dateStr)
        

        if locationTextfield.text != "" {
            
        UserInputHelper.sharedInstance.place = locationTextfield.text
        self.performSegue(withIdentifier: "segueFromTimeToUserInformation", sender: nil)
            
        }
    }

}

extension BookTimeAndPlaceController {
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
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

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

