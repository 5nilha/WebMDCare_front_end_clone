//
//  RecentlyViewedCollectionViewCell.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class RecentlyViewedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var doctorProfileView: UIView!
    @IBOutlet weak var doctorProfileImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.doctorProfileView.shadow(radius: 1, color: .black)
        self.doctorProfileImageView.shadow(radius: 1, color: .black)
        self.doctorProfileView.circle()
        self.doctorProfileImageView.circle()
        self.cardView.corner(radius: 6)
        self.cardView.shadow(radius: 2, color: .gray)
        
    }
    
}
