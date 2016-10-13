//
//  starRatingView.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/13/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit

class starRatingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
    }
    required init?(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    
    func addStars(starCount: Int){
        //Padding should not be 100 - but the width is screwing up
//        (100-(5*16.2 + 4*3.8))/2
        var padding: CGFloat = (100.0 - (CGFloat (starCount) * 16.2 + (CGFloat (starCount) - 1.0) * 3.8))/2.0
        print(padding)
        for i in 0..<starCount{
            
            //Shift between stars is 3.8 + 16.2 = 20
            let starShift: CGFloat = 20 * CGFloat(i)
            let starImage = UIImage(named: "Star")
            print(padding + starShift)
            let starFrame = CGRect(x: padding + starShift, y: 0, width: 16.2, height: 15.4)
            let starImageView = UIImageView(image: starImage)
            starImageView.frame = starFrame

            
            self.addSubview(starImageView)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
