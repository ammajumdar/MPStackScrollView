//
//  DetailsViewController.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 25/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Details"
        let label = UILabel()
        label.text = "Its a demo detail View"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerInSuperview()
    }
}
