//
//  MPStackCell.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//


import UIKit

open class MPStackCell: UIView, MPStackCellType {
  
  open var shouldAnimateLayoutChanges: Bool = true

    open override func invalidateIntrinsicContentSize() {
    super.invalidateIntrinsicContentSize()
    updateLayout(animated: shouldAnimateLayoutChanges)
  }
}
