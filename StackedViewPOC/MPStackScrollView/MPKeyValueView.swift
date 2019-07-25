//
//  MPKeyValueView.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

enum KeyValueType {
    case textField
    case actionButton
    case chevron
    case toggle
}

class MPKeyValueView: StackCellBase {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let inputField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textAlignment = .right
        textField.textColor = .blue
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(MPKeyValueView.actionButtonTapped(_ :)), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.addTarget(self, action: #selector(MPKeyValueView.switchtoggled(_:)), for: .valueChanged)
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    var didSelect: () -> Void = {}
    
    @objc func actionButtonTapped(_ button: UIButton) {
        print("Tapped")
    }
    
    @objc func switchtoggled(_ toggle: UISwitch) {
        print("switchtoggled")
    }
    
    @objc func rowTapped(_ tapGesture: UITapGestureRecognizer) {
        print("Navigate to detail")
        didSelect()
    }
    
    init(title: String,
         actionButtonTitle: String? = nil,
         placeholder: String? = nil,
         prefiledText: String? = nil,
         keyValueType: KeyValueType,
         backgroundColor: UIColor = .white,
         isOn: Bool = false,
         leftPadding: CGFloat = 20.0,
         rightPadding: CGFloat = 20.0) {
      
        super.init()
       
        self.backgroundColor = backgroundColor
        titleLabel.text = title
        titleLabel.withWidth(200)
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        let spacing: CGFloat = 100
        switch keyValueType {
            
        case .actionButton:
            hstack(titleLabel, actionButton,
                   spacing: spacing,
                   alignment: .center).applyLeftPadding(leftPadding).applyRightPadding(rightPadding)
            actionButton.setTitle(actionButtonTitle, for: .normal)
            
        case .chevron:
            chevron.withSize(.init(width: 15, height: 15))
            hstack(titleLabel, chevron,
                   spacing: spacing,
                   alignment: .center).applyLeftPadding(leftPadding).applyRightPadding(rightPadding)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MPKeyValueView.rowTapped(_ :)))
            addGestureRecognizer(tapGesture)
            
        case .textField:
            hstack(titleLabel, inputField,
                   spacing: spacing,
                   alignment: .center).applyLeftPadding(leftPadding).applyRightPadding(rightPadding)
            inputField.placeholder = placeholder
            inputField.text = prefiledText
            
        case .toggle:
            toggle.withWidth(50)
            hstack(titleLabel, toggle, spacing: spacing, alignment: .center).applyLeftPadding(leftPadding).applyRightPadding(rightPadding)
            toggle.setOn(isOn, animated: true)
        }
    }
    
    func addTopSeparator(separatorColor: UIColor = .gray, padding: UIEdgeInsets = .zero) {
        let separatorView = UIView()
        separatorView.backgroundColor = separatorColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        separatorView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: padding, size: .init(width: 0, height: 0.5))
    }
    
    func addBottomSeparator(separatorColor: UIColor = .gray, padding: UIEdgeInsets = .zero) {
        let separatorView = UIView()
        separatorView.backgroundColor = separatorColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        separatorView.anchor(leading: leadingAnchor ,bottom: bottomAnchor, trailing: trailingAnchor, padding: padding, size: .init(width: 0, height: 0.5))
    }
    
    func addBottomSeparator(separatorColor: UIColor = .gray, withleftPadding padding: CGFloat) {
        let separatorView = UIView()
        separatorView.backgroundColor = separatorColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        separatorView.anchor(leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 0, left: padding, bottom: 0, right: 0),
                             size: .init(width: 0, height: 0.5))
    }
    
    func addTopSeparator(separatorColor: UIColor = .gray, withLeftPadding padding: CGFloat) {
        let separatorView = UIView()
        separatorView.backgroundColor = separatorColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        separatorView.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 0, left: padding, bottom: 0, right: 0),
                             size: .init(width: 0, height: 0.5))
    }
}
