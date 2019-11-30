//
//  DataServices.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import Foundation

class DataServices {
    
    static func load(completion: @escaping ([Doctor]) -> Void) {
        let doctors = [
            Doctor(id: "01", name: "Kent Rusth", address: "4986 W Central Pkwy, Altamont Springs", coordinates: Geolocation(latitude: 28.663158, longitude: -81.363219), overview: "Dr. Kent Rusth has being a Family Physician in Altamont Springs since 1996.", experience: Experience(yearsExperience: 39, speciality: "Family Medicine", education: [Education(school: "University of Central Florida", program: "Medical School")]), phone: "(585) 567-0078", workHours: ["Mon - Fri" : "8:00am - 6:00pm", "Sat" : "closed", "Sun" : "closed"], acceptingNewPatients: true, medicareAccepted: true, medicaidAccepted: false, reviewStars: 4.3, profilePicture: nil, isSponsored: false),
            Doctor(id: "02", name: "Angela Farah  ", address: "1221 New Independence Pkwy,Winter Garden", coordinates: Geolocation(latitude: 28.473711, longitude: -81.627758), overview: "Dr. Angela Farah has being a Family Physician in Winter Garden since 2000.", experience: Experience(yearsExperience: 19, speciality: "Family Medicine", education: [Education(school: "University of Central Florida", program: "Medical School")]), phone: "(509) 968-1234", workHours: ["Mon - Fri" : "8:00am - 6:00pm", "Sat" : "closed", "Sun" : "closed"], acceptingNewPatients: true, medicareAccepted: true, medicaidAccepted: false, reviewStars: 4.3, profilePicture: nil, isSponsored: true)]
        completion(doctors)
    }
}
