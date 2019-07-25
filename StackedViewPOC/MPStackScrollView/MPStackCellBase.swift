//
//  MPStackCellBase.swift
//  StackScrollView
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

class MPStackCellBase: UIControl, MPStackCellType {
  
  init() {
    super.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
