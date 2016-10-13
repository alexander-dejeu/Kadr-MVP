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
        self.title = "Date and Time"
        
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
        self.performSegue(withIdentifier: "segueFromTimeToUserInformation", sender: nil)
    }

}
