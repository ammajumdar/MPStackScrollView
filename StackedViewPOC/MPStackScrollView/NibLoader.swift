//
//  NibLoader.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

public struct NibLoader<T: UIView> {
  
  public let name: String?
  public let bundle: Bundle?
  
  public init(name: String? = nil, bundle: Bundle? = nil) {
    self.name = name
    self.bundle = bundle
  }
  
  func nib() -> UINib {
    return UINib(nibName: name ?? String(describing: T.self), bundle: bundle ?? Bundle(for: T.self))
  }
  
  public func load() -> T {
    let nib = self.nib()
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? T else {
      fatalError("The nib \(nib) expected its root view to be of type \(T.self)")
    }
    return view
  }
}
