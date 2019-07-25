//
//  ListIteratorDelegate.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 23/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

protocol ListIteratorDelegate {
    func listView(_ listView: UIView, didSelectItem item: UIView, atIndex index: Int)
}
