//
//  DoctorsListViewController.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit
import CoreLocation

protocol DoctorsListDelegate{
    func viewedDoctors(doctors: [Doctor])
    func doctorsListWillDismiss(controller: UIViewController)
}

class DoctorsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var segmentedControl = UISegmentedControl(items: ["List", "Map"])
    var userLocation: CLLocationCoordinate2D!
    
    var delegate: DoctorsListDelegate!
    var doctors = [Doctor]()
    var recentViewedDoctors = [Doctor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadData()
        self.setupView()
    }
    
    private func setupView() {
        self.navigationItem.titleView = segmentedControl
        self.segmentedControl.selectedSegmentIndex = 0
    }
    
    private func loadData() {
        DataServices.load { [unowned self] (doctors) in
            self.doctors = doctors.sorted(by: { (a, b) -> Bool in
                return a.name < b.name
            })
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backButtonTapped() {
        if self.delegate != nil {
            delegate.viewedDoctors(doctors: recentViewedDoctors)
            delegate.doctorsListWillDismiss(controller: self)
        }
    }

}

extension DoctorsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorInformationCell", for: indexPath) as! DoctorInformationCell
        let doctor = doctors[indexPath.row]
        let distance = userLocation.getDistanceFromLocation(coordinate: CLLocationCoordinate2D(latitude: doctor.coordinates.latitude, longitude: doctor.coordinates.longitude))
        cell.setupCell(doctor: doctors[indexPath.row], distance: distance)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let doctor = doctors[indexPath.row]
        
        if doctor.isSponsored {
            return 300
        } else {
            return 150
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor = doctors[indexPath.row]
        if !recentViewedDoctors.contains(where: { (element) -> Bool in
            return element.id.contains(doctor.id)
        }) {
            recentViewedDoctors.append(doctor)
        }
    }
    
    
}
