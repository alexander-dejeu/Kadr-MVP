//
//  HomeController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    
    //Customer Support Button Radius = 3pt
    //All views have 3pt radius as well
    @IBOutlet weak var bookPhotographerView: UIView!
    @IBOutlet weak var yourBookingsView: UIView!
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var customerSupportButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseHelper.sharedInstance.loginWithFirebase()
        
        self.title = "Kadr"
        UIHelper.addCornersTo(view: bookPhotographerView)
        UIHelper.addCornersTo(view: yourBookingsView)
        UIHelper.addCornersTo(view: portfolioView)
        UIHelper.addCornersTo(view: customerSupportButton)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using 
        if segue.identifier == "segueFromHomeToBookings" {
         let nextScene = segue.destination as? BookingsController
        nextScene?.name = infoDict["name"]
        nextScene?.date = infoDict["date"]
        nextScene?.time = infoDict["time"]
        nextScene?.place = infoDict["place"]
        nextScene?.phone = infoDict["phoneNumber"]
        nextScene?.stars = infoDict["stars"]
            
        }
        
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func bookPhotographerButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromHomeToBookPhotographer", sender: nil)
    }
    
    var infoDict = [String : String]()
    
    @IBAction func yourBookingsButtonTapped(_ sender: AnyObject) {
        
        FirebaseHelper.sharedInstance.checkExistingBooking(completion: { status in
            if status {
                FirebaseHelper.sharedInstance.checkAssignPhoto(completion: {
                status, infoDict in
                    
                    if status {
                    print(infoDict)
                    self.infoDict = infoDict
                    self.performSegue(withIdentifier: "segueFromHomeToBookings", sender: nil)
                    } else {
                    self.performSegue(withIdentifier: "waiting", sender: nil)
                    }
                    
                })
           
            } else {
            self.performSegue(withIdentifier: "emptyBooking", sender: nil)
            }
            })
        
          }
    
    @IBAction func portfolioButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromHomeToProfile", sender: nil)
    }
    
    @IBAction func customerSupportButtonTapped(_ sender: AnyObject) {
        openChat()
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
    }
    
    func openChat() {
        
        
        Smooch.show()
        
        let settings = SKTSettings(appToken: "cdbddzh8h2oo3p4do3pdu3mde")
        settings.conversationAccentColor = UIColor(red: 70.0 / 255.0, green: 171.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
        
        UINavigationBar.appearance().tintColor = UIColor(red: 70.0 / 255.0, green: 171.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [ NSForegroundColorAttributeName : UIColor(red: 70.0 / 255.0, green: 171.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)]
    }


}
