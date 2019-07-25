//
//  HeaderStackCell.swift
//  StackScrollView
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

final class HeaderStackCell: StackCellBase {
  
  let label = UILabel()
  
    init(title: String,
         backgroundColor: UIColor = .white,
         textColor: UIColor = .black,
         font: UIFont = UIFont.boldSystemFont(ofSize: 13),
         textAlignment: NSTextAlignment = .left,
         padding: UIEdgeInsets,
         size: CGSize = .zero) {
    super.init()
    self.backgroundColor = backgroundColor
    label.font = font
    label.numberOfLines = 0
    label.textAlignment = textAlignment
    label.textColor = textColor
    
    addSubview(label)
    label.anchor(top: topAnchor,
                 leading: leadingAnchor,
                 bottom: bottomAnchor,
                 trailing: trailingAnchor,
                 padding: padding,
                 size: size)
    label.text = title
  }
}
