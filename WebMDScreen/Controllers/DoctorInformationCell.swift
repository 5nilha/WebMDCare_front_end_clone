//
//  DoctorInformationCell.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class DoctorInformationCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var sponsoredView: UIStackView!
    @IBOutlet weak var newPatientsLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameInitials: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var addressLabel :UILabel!
    @IBOutlet weak var requestAppointmentButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var information: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.corner(radius: 14)
        self.cellView.shadow(radius: 2, color: .black)
        self.profileView.circle()
        self.profileView.shadow(radius: 1, color: .black)
        self.requestAppointmentButton.corner(radius: self.requestAppointmentButton.frame.height / 2)
        self.phoneButton.corner(radius: self.phoneButton.frame.height / 2)
        self.phoneButton.border(width: 2.0, color: .systemBlue)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(doctor: Doctor, distance: Double) {
        self.nameInitials.text = doctor.initials
        self.nameLabel.text = doctor.name
        self.specialityLabel.text = doctor.experience.speciality
        self.addressLabel.text = doctor.address
        
        if doctor.isSponsored {
            self.phoneButton.isHidden = false
            self.requestAppointmentButton.isHidden = false
            self.sponsoredView.isHidden = false
            self.newPatientsLabel.isHidden = false
            self.information.text = "\(doctor.experience.yearsExperience) Years Experience | \(String(format: "%.2f", distance)) mi."
        } else {
            self.phoneButton.isHidden = true
            self.requestAppointmentButton.isHidden = true
            self.sponsoredView.isHidden = true
            self.newPatientsLabel.isHidden = true
            self.information.text = "\(String(format: "%.2f", distance)) mi."
        }
        
    }

}
