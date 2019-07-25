//
//  UIStackView+EasyPadding.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

extension UIStackView {
   
    @discardableResult
    
    /// Function that sets up a stackview with margins
    ///
    /// - Parameter margins: UIEdgeInsets instance
    /// - Returns: UIStackView
    public func withMargins(_ margins: UIEdgeInsets) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = margins
        return self
    }
    
    @discardableResult
    
    /// Function that applies left Padding
    ///
    /// - Parameter left: Left Padding
    /// - Returns: UIStackView
    public func applyLeftPadding(_ left: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    
    /// Function that applies top Padding
    ///
    /// - Parameter top: Top Padding
    /// - Returns: UIStackView
    public func applyTopPadding(_ top: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    
    @discardableResult
    
    /// Function that applies bottom Padding
    ///
    /// - Parameter bottom: Bottom Padding
    /// - Returns: UIStackView
    public func applyBottomPadding(_ bottom: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
    
    @discardableResult
    
    /// Function that applies right Padding
    ///
    /// - Parameter right: Right Padding
    /// - Returns: UIStackView
    public func applyRightPadding(_ right: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
}
