//
//  BookingsController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class BookingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name: String!
    var date: String!
    var time: String!
    var place: String!
    var phone: String!
    var stars: String!
    var ranking: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your photographer"
        
        switch stars {
            case "one": ranking = 1
            case "two": ranking = 2
            case "three": ranking = 3
            case "four": ranking = 4
            case "five": ranking = 5
        default: ranking = 5
        }

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingsCell
        cell.setView()
        cell.setStars(starCount: ranking)
        
        cell.photographerNameLabel.text = name
        cell.bookingDateLabel.text = date
        cell.bookingLocationLabel.text = place
        cell.bookingTimeLabel.text = time
        
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
