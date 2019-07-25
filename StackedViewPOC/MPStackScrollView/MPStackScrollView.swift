//
//  MPStackScrollView.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

open class MPStackScrollView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private enum MPStackLayoutKeys {
        static let top: String = "com.myPath.mpStackScrollView.top"
        static let leading: String = "com.myPath.mpStackScrollView.leading"
        static let trailing: String = "com.myPath.mpStackScrollView.trailing"
        static let bottom: String = "com.myPath.mpStackScrollView.bottom"
        static let width: String = "com.myPath.mpStackScrollView.width"
        static let height: String = "com.myPath.mpStackScrollView.height"
    }
    
    private static func defaultLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        return layout
    }
    
    @available(*, unavailable)
    open override var dataSource: UICollectionViewDataSource? {
        didSet {
        }
    }
    
    @available(*, unavailable)
    open override var delegate: UICollectionViewDelegate? {
        didSet {
        }
    }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    public convenience init(frame: CGRect) {
        self.init(frame: frame, collectionViewLayout: MPStackScrollView.defaultLayout())
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private(set) public var views: [UIView] = []
    
    private func identifier(_ v: UIView) -> String {
        return v.hashValue.description
    }
    
    private func setup() {
        
        backgroundColor = .white
        alwaysBounceVertical = true
        delaysContentTouches = false
        keyboardDismissMode = .interactive
        backgroundColor = .clear
        super.delegate = self
        super.dataSource = self
    }
    
    open override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
    
    open func append(view: UIView) {
        views.append(view)
        register(Cell.self, forCellWithReuseIdentifier: identifier(view))
        reloadData()
    }
    
    open func append(views _views: [UIView]) {
        views += _views
        _views.forEach { view in
            register(Cell.self, forCellWithReuseIdentifier: identifier(view))
        }
        reloadData()
    }
    
    @available(*, unavailable, message: "Unimplemented")
    func append(lazy: @escaping () -> UIView) {

    }
    
    open func remove(view: UIView, animated: Bool) {
        
        if let index = views.firstIndex(of: view) {
            views.remove(at: index)
            if animated {
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 0,
                    options: [
                        .beginFromCurrentState,
                        .allowUserInteraction,
                        .overrideInheritedCurve,
                        .overrideInheritedOptions,
                        .overrideInheritedDuration
                    ],
                    animations: {
                        self.performBatchUpdates({
                            self.deleteItems(at: [IndexPath(item: index, section: 0)])
                        }, completion: nil)
                }) { (finish) in
                    
                }
                
            } else {
                UIView.performWithoutAnimation {
                    performBatchUpdates({
                        self.deleteItems(at: [IndexPath(item: index, section: 0)])
                    }, completion: nil)
                }
            }
        }
    }
    
    open func remove(views: [UIView], animated: Bool) {
        var indicesForRemove: [Int] = []
        views.forEach { (view) in
            if let index = self.views.firstIndex(of: view) {
                indicesForRemove.append(index)
            }
        }
        // It seems that the layout is not updated properly unless the order is aligned.
        indicesForRemove.sort(by: >)
        indicesForRemove.forEach { (index) in
            self.views.remove(at: index)
        }
        if animated {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0,
                options: [
                    .beginFromCurrentState,
                    .allowUserInteraction,
                    .overrideInheritedCurve,
                    .overrideInheritedOptions,
                    .overrideInheritedDuration
                ],
                animations: {
                    self.performBatchUpdates({
                        self.deleteItems(at: indicesForRemove.map { IndexPath.init(item: $0, section: 0) })
                    }, completion: nil)
            })
        } else {
            UIView.performWithoutAnimation {
                performBatchUpdates({
                    self.deleteItems(at: indicesForRemove.map { IndexPath.init(item: $0, section: 0) })
                }, completion: nil)
            }
        }
    }
    
    open func scroll(to view: UIView, animated: Bool) {
        let targetRect = view.convert(view.bounds, to: self)
        scrollRectToVisible(targetRect, animated: true)
    }
    
    open func scroll(to view: UIView, at position: UICollectionView.ScrollPosition, animated: Bool) {
        if let index = views.firstIndex(of: view) {
            scrollToItem(at: IndexPath(item: index, section: 0), at: position, animated: animated)
        }
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return views.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = views[indexPath.item]
        let _identifier = identifier(view)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _identifier, for: indexPath)
        if view.superview == cell.contentView {
            return cell
        }
        precondition(cell.contentView.subviews.isEmpty)
        if view is MPManualLayoutStackCellType {
            cell.contentView.addSubview(view)
        } else {
            view.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(view)
            let top = view.topAnchor.constraint(equalTo: cell.contentView.topAnchor)
            let leading = view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor)
            let bottom = view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
            let trailing = view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
            
            top.identifier = MPStackLayoutKeys.top
            leading.identifier = MPStackLayoutKeys.leading
            bottom.identifier = MPStackLayoutKeys.bottom
            trailing.identifier = MPStackLayoutKeys.trailing
            NSLayoutConstraint.activate([top, leading, bottom, trailing])
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let view = views[indexPath.item]
        if let view = view as? MPManualLayoutStackCellType {
            return view.size(maxSize: .init(width: collectionView.bounds.width, height: 0))
        } else {
                let width: NSLayoutConstraint = {
                guard let widthConstraint = view.constraints.filter({ $0.identifier == MPStackLayoutKeys.width }).first else {
                    let width = view.widthAnchor.constraint(equalToConstant: collectionView.bounds.width)
                    width.identifier = MPStackLayoutKeys.width
                    width.isActive = true
                    return width
                }
                return widthConstraint
            }()
            width.constant = collectionView.bounds.width
            let size = view.superview?.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize) ?? view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            return size
        }
    }
    
    public func updateLayout(animated: Bool,
                             duration: TimeInterval = 0.5,
                             delay: TimeInterval = 0,
                             damping: CGFloat = 1.0,
                             springVelocity: CGFloat = 1.0) {
        if animated {
            UIView.animate(
                withDuration: duration,
                delay: delay,
                usingSpringWithDamping: damping,
                initialSpringVelocity: springVelocity,
                options: [
                    .beginFromCurrentState,
                    .allowUserInteraction,
                    .overrideInheritedCurve,
                    .overrideInheritedOptions,
                    .overrideInheritedDuration
                ],
                animations: {
                    self.performBatchUpdates(nil, completion: nil)
                    self.layoutIfNeeded()
            }) { (finish) in
                
            }
        } else {
            UIView.performWithoutAnimation {
                self.performBatchUpdates(nil, completion: nil)
                self.layoutIfNeeded()
            }
        }
    }
    
    final class Cell: UICollectionViewCell {
        override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
            return layoutAttributes
        }
    }
}
