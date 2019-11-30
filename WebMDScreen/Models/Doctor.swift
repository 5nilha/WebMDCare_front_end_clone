//
//  Doctor.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit


struct Doctor {
    
    let id: String
    let name: String
    let address: String
    let coordinates: Geolocation
    let overview: String
    let experience: Experience
    let phone: String
    let workHours: [String : String]
    let acceptingNewPatients: Bool
    let medicareAccepted: Bool
    let medicaidAccepted: Bool
    let reviewStars: Float
    let profilePicture: UIImage?
    let isSponsored: Bool
    
    var initials: String {
        let arr = name.split(separator: " ")
       
        let firstNameInitial = arr.first?.first
        let lastNameInitial = arr.last?.first
        return "\(firstNameInitial!)\(lastNameInitial!)"
    }
    
}

struct Experience {
    let yearsExperience: Int
    let speciality: String
    let education: [Education]
}

struct Education {
    let school: String
    let program: String
}

struct Geolocation {
    let latitude: Double
    let longitude: Double
}
