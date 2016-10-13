//
//  UIHelper.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import Foundation
import UIKit

class UIHelper{
    
    class func addCornersTo(view: UIView){
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
    }
}
