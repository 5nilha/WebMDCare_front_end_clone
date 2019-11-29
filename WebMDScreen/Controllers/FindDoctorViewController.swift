//
//  FindDoctorViewController.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class FindDoctorViewController: UIViewController {
    
    @IBOutlet weak var searchDoctorsView: UIView!
    @IBOutlet weak var searchZipCodeView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recentViewedGrid: UICollectionView!
    
    lazy var logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
    
    var recentViewedDoctors = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recentViewedGrid.delegate = self
        self.recentViewedGrid.dataSource = self
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

  
}

extension FindDoctorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentlyViewedCell", for: indexPath) as! RecentlyViewedCollectionViewCell
        
        return cell
    }
    
    
}
