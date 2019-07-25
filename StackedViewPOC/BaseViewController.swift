//
//  BaseViewController.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

struct Configuration {
    
    let backgroundColor: UIColor
    let textColor: UIColor
    let tag: Int
    let text: String
    let cornerRadius: CGFloat
    let font: UIFont
    let borderColor: UIColor
    let borderWidth: CGFloat
    let edgeInsets: UIEdgeInsets
    let size: CGSize
}

//class BaseViewController<U, T>: UIViewController {
//
//    var baseConfiguration: U!
//    var senderConfig: T!
//
//    baseConfiguration = Configuration(backgroundColor: .white,
//    textColor: .blue,
//    tag: 1,
//    text: "Login",
//    cornerRadius: 4,
//    font: .systemFont(ofSize: 12),
//    borderColor: .blue,
//    borderWidth: 1.0,
//    edgeInsets: .init(top: 20, left: 20, bottom: 0, right: 20),
//    size: .init(width: 0, height: 50))
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
