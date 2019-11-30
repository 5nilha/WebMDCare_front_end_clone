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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciality: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.doctorProfileView.shadow(radius: 1, color: .black)
        self.doctorProfileImageView.shadow(radius: 1, color: .black)
        self.doctorProfileView.circle()
        self.doctorProfileImageView.circle()
        self.cardView.corner(radius: 6)
        self.cardView.shadow(radius: 2, color: .gray)
        
    }
    
    func setupCell(doctor: Doctor) {
        self.nameLabel.text = doctor.name
        self.speciality.text = doctor.experience.speciality
        
        if doctor.profilePicture == nil {
            self.doctorProfileImageView.isHidden = true
            self.initialsLabel.isHidden = false
            self.initialsLabel.text = doctor.initials
        } else {
            self.doctorProfileImageView.isHidden = false
            self.initialsLabel.isHidden = true
            self.doctorProfileImageView.image = doctor.profilePicture
        }
    }
    
}
