//
//  UIView+EasyStackLayout.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

extension UIView {
    
    
    /// Private function to configure a UIStackView
    ///
    /// - Parameters:
    ///   - axis: Axis that decides the layout in which the subview will be arranges
    ///   - views: The views that needs arrangement
    ///   - spacing: Spacing
    ///   - alignment: Alighment
    ///   - distribution: Distribution
    /// - Returns: A UIStackView
    
    private func _stack(axis: NSLayoutConstraint.Axis = .vertical,
                         views: [UIView],
                       spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                  distribution: UIStackView.Distribution = .fill,
                       padding: UIEdgeInsets)  -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperview(padding: padding)
        return stackView
    }
    
    /// This will layout views in a horizontal Stack
    ///
    /// - Parameters:
    ///   - views: The views that needs arrangement
    ///   - spacing: Spacing between the Views
    ///   - alignment: Alignment of the Stack
    ///   - distribution: Distribution of the Stack
    /// - Returns: A Horizontally Stacked View
    @discardableResult
    public func hstack(_ views: UIView...,
                         spacing: CGFloat = 0,
                       alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero) -> UIStackView {
        return _stack(axis: .horizontal,
                      views: views,
                      spacing: spacing,
                      alignment: alignment,
                      distribution: distribution,
                      padding: padding)
    }
    
    /// This will layout views in a vertical Stack
    ///
    /// - Parameters:
    ///   - views: The views that needs arrangement
    ///   - spacing: Spacing between the Views
    ///   - alignment: Alignment of the Stack
    ///   - distribution: Distribution of the Stack
    /// - Returns: A Vertically Stacked View
    @discardableResult
    public func vstack(_ views: UIView...,
                         spacing: CGFloat = 0,
                       alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero) -> UIStackView {
        return _stack(axis: .vertical,
                      views: views,
                      spacing: spacing,
                      alignment: alignment,
                      distribution: distribution,
                      padding: padding)
    }
    
    @discardableResult
    public func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    public func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func withBorder<T: UIView>(width: CGFloat, color: UIColor) -> T {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self as! T
    }
    
    @discardableResult
    public func withBottomAnchorValue(_ value: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -value).isActive = true
        }
        return self
    }
    
}

extension UIEdgeInsets {
    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
