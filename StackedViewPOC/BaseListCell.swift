//
//  BaseListCell.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

public enum SeparatorType: Int, CaseIterable {
    case top
    case bottom
}

open class BaseListCell<T>: UITableViewCell {
   
    /// dataItem is fed in automatically from ListHeaderController
    open var dataItem: T!
    
    /// parentController is set to the ParentController that is rendering this view.  This is useful for scenarios where a view contains a UIButton and you want to use addTarget(...) to trigger an action in the controller.
    open weak var parentController: UIViewController?
    
    public let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))

    /// This convenience method sets up the separate line with some optional left & right padding
    open func addSeparatorViewWith(leftPadding: CGFloat = 0,
                                   righttPadding: CGFloat = 0,
                                   separatorType: SeparatorType) {
        addSubview(separatorView)
        if separatorType == .top {
            separatorView.anchor(top: topAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: 0, left: leftPadding, bottom: 0, right: righttPadding),
                                 size: .init(width: 0, height: 0.5))
        } else {
            separatorView.anchor(leading: leadingAnchor,
                                 bottom: bottomAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: 0, left: leftPadding, bottom: 0, right: righttPadding),
                                 size: .init(width: 0, height: 0.5))
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("(coder aDecoder: NSCoder) not implemented")
    }
    
    /// In your custom ListCell classes, just override setupViews() to provide custom behavior.  We do this to avoid overriding init methods.
    open func setupViews() { }
}
