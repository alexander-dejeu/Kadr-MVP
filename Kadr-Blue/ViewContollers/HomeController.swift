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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func bookPhotographerButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromHomeToBookPhotographer", sender: nil)
    }
    
    @IBAction func yourBookingsButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromHomeToBookings", sender: nil)
    }
    
    @IBAction func portfolioButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "segueFromHomeToProfile", sender: nil)
    }
    
    @IBAction func customerSupportButtonTapped(_ sender: AnyObject) {
        
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
    }


}
