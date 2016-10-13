//
//  BookingsCell.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class BookingsCell: UITableViewCell {

    @IBOutlet weak var photographerNameLabel: UILabel!
    @IBOutlet weak var bookingDateLabel: UILabel!
    @IBOutlet weak var bookingLocationLabel: UILabel!
    @IBOutlet weak var bookingTimeLabel: UILabel!
    
    @IBOutlet weak var starRating: starRatingView!
    
    @IBOutlet weak var bookingView: UIView!
    
    func setView(){
        UIHelper.addCornersTo(view: bookingView)
    }
    
    func setStars(starCount: Int){
        starRating.addStars(starCount: starCount)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func callButtonPressed(_ sender: AnyObject) {
        print("calling the photographer!")
    }
    
    @IBAction func cancelOrderButtonPressed(_ sender: AnyObject) {
        print("trying to cancel the order")
    }

}
