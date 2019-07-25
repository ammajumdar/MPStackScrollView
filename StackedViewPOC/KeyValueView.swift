//
//  KeyValueView.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 23/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

class KeyValueView: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureKeyValueView(withTitle title: String,
                    withPlaceholder placeholder: String? = nil,
                           prefilledValue value: String? = nil,
                           theme: Any) {
        
    }
}
