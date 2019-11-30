//
//  UIView+Extension.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

extension UIView {
    func circle() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    func corner(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func shadow(radius: CGFloat, color: UIColor) {
        self.layer.shouldRasterize = true
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    
}
