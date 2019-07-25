//
//  MPStackCellType.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

public protocol MPStackCellType: class { }

public protocol MPManualLayoutStackCellType: MPStackCellType {
    func size(maxSize: CGSize?) -> CGSize
}

extension MPStackCellType where Self: UIView {
    
    public var stackScrollView: MPStackScrollView? {
        var superview: UIView? = self
        while superview != nil && !(superview is MPStackScrollView) {
            superview = superview?.superview
        }
        return superview as? MPStackScrollView
    }
    public func scroll(animated: Bool) {
        stackScrollView?.scroll(to: self, animated: animated)
    }
    public func scroll(to position: UICollectionView.ScrollPosition, animated: Bool) {
        stackScrollView?.scroll(to: self, at: position, animated: animated)
    }
    public func updateLayout(animated: Bool) {
        invalidateIntrinsicContentSize()
        stackScrollView?.updateLayout(animated: animated)
    }
    public func remove() {
        stackScrollView?.remove(view: self, animated: true)
    }
}
