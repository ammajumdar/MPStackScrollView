//
//  ButtonStackCell.swift
//  StackScrollView
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

final class ButtonStackCell: MPStackCellBase {
  
  var tapped: () -> Void = {}

  private let button = UIButton(type: .system)
  
    init(backgroundColor: UIColor = .white,
         buttonTitle: String,
         padding: UIEdgeInsets,
         size: CGSize) {
    super.init()
    let bgcolor = UIColor(red: 0.0/255.0, green: 129.0/255.0, blue: 234.0/255.0, alpha: 1.0)
    self.backgroundColor = backgroundColor
    button.backgroundColor = bgcolor
    button.layer.borderColor = bgcolor.cgColor
    button.layer.borderWidth = 1.0
    button.layer.cornerRadius = 8.0
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    addSubview(button)
    button.anchor(top: topAnchor,
                  leading: leadingAnchor,
                  bottom: bottomAnchor,
                  trailing: trailingAnchor,
                  padding: padding,
                  size: size)
    button.setTitle(buttonTitle, for: .normal)
    button.setTitleColor(.white, for: .normal)
  }
  
  @objc private func buttonTapped() {
    tapped()
  }
}
