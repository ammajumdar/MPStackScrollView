//
//  ActionButtonView.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

class ActionButtonView<T>: UIView {

    open var configuration: T!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareInterface()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("coder aDecoder: NSCoder not implemented")
    }
    
    open func prepareInterface() {}
}
