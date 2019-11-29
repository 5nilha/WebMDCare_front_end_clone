//
//  ViewController.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupView()
    }
    
    private func setupView() {
        searchBar.placeholder = "Search drugs, conditions, news..."
        navigationItem.titleView = searchBar
    }


}

