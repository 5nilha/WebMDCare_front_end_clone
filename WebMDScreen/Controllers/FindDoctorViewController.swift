//
//  FindDoctorViewController.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit
import CoreLocation

class FindDoctorViewController: UIViewController, DoctorsListDelegate {
    
    @IBOutlet weak var searchDoctorsView: UIView!
    @IBOutlet weak var searchZipCodeView: UIView!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recentViewedGrid: UICollectionView!
    
    lazy var logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
    
    var locationManager: CLLocationManager!
    var userLocation: CLLocationCoordinate2D!
    var recentViewedDoctors = [Doctor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recentViewedGrid.delegate = self
        self.recentViewedGrid.dataSource = self
        self.setupLocationManager()
        self.setupView()
    }
    private func setupView() {
        self.searchDoctorsView.corner(radius: 8)
        self.searchDoctorsView.border(width: 1, color: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.1))
        self.searchZipCodeView.corner(radius: 8)
        self.searchZipCodeView.border(width: 1, color: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.1))
        self.searchButton.corner(radius: self.searchButton.frame.height / 2)
        self.logoImageView.image = UIImage(named: "logo")
        navigationItem.titleView = logoImageView
        logoImageView.contentMode = .scaleAspectFit
    }
    
    func viewedDoctors(doctors: [Doctor]) {
        self.recentViewedDoctors = doctors
        self.recentViewedGrid.reloadData()
    }
    
    func doctorsListWillDismiss(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDoctorsList" {
            let destination = segue.destination as! DoctorsListViewController
            destination.userLocation = self.userLocation
            destination.delegate = self
        }
    }
    
    @IBAction func searchDoctorsButtonTapped() {
        self.performSegue(withIdentifier: "goToDoctorsList", sender: self)
    }
}

extension FindDoctorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recentViewedDoctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentlyViewedCell", for: indexPath) as! RecentlyViewedCollectionViewCell
        cell.setupCell(doctor: recentViewedDoctors[indexPath.row])
        return cell
    }
    
    
}

extension FindDoctorViewController: CLLocationManagerDelegate {
    
    private func setupLocationManager() {
           self.locationManager = CLLocationManager()
           self.locationManager.delegate = self
           if CLLocationManager.locationServicesEnabled() {
               if  CLLocationManager.authorizationStatus() != .authorizedWhenInUse || CLLocationManager.authorizationStatus() != .authorizedAlways{
                   self.locationManager.requestWhenInUseAuthorization()
               }
           }
       }
       
    private func setupUserLocation() {
        self.userLocation = locationManager.location?.coordinate
        if userLocation != nil {
            self.userLocation.getAddressFromCoordinate { (placemark, error) in
                if let error = error {
                    self.zipcodeLabel.text = ""
                    self.zipcodeLabel.textColor = .systemGray
                    print(error.localizedDescription)
                    return
                }
                guard let placemark = placemark else { return }
                self.zipcodeLabel.text = placemark.postalCode
                self.zipcodeLabel.textColor = .black
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            self.setupUserLocation()
            break
        case .denied, .notDetermined, .restricted:
            self.locationManager.requestWhenInUseAuthorization()
            break
        default:
            print("Unmatched Case")
        }
    }
}
