//
//  PortfolioCell.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class PortfolioCell: UITableViewCell {
    
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var portfolioImage: UIImageView!

    func setupView(){
        portfolioView.layer.cornerRadius = 3
        portfolioView.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
