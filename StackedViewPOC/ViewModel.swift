//
//  ViewModel.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 24/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

protocol ViewModelDelegate {
    func didSelectRow(_ row: MPKeyValueView, atIndexPath indexPath: Int)
}

class ViewModel {
    
    var bgcolor: UIColor {
        return UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
    
    var delegate: ViewModelDelegate?
    
    var dataSource: [UIView] {
        
        var dataSource: [UIView] = []
        let titleLbl = HeaderStackCell(title: "Stacked Layout POC",
                                       backgroundColor: .clear,
                                       textAlignment: .center,
                                       padding: .init(top: 40, left: 20, bottom: 360, right: 20))
        
        
        let dosageStrengthKey = MPKeyValueView(title: "Dosage Strength",
                                               prefiledText: "50",
                                               keyValueType: .textField)
        dosageStrengthKey.addTopSeparator()
        dosageStrengthKey.addBottomSeparator(withleftPadding: 20)
        
        let dosageUnitKey = MPKeyValueView(title: "Dosage Unit",
                                           actionButtonTitle: "mg",
                                           keyValueType: .actionButton)
        dosageUnitKey.addBottomSeparator(withleftPadding: 20)
        
        
        let switchView = MPKeyValueView(title: "Add to Favourite",
                                        keyValueType: .toggle,
                                        isOn: true)
        switchView.addBottomSeparator(withleftPadding: 20)
        
        let chevronView = MPKeyValueView(title: "A demo chevron Row",
                                         keyValueType: .chevron)
        chevronView.addBottomSeparator()
        
        chevronView.didSelect = { [unowned chevronView] in
            self.delegate?.didSelectRow(chevronView, atIndexPath: 4)
        }
        
        let continueButton = ButtonStackCell(backgroundColor: .clear, buttonTitle: "Continue", padding: .init(top: 40, left: 20, bottom: 20, right: 20), size: .init(width: 0, height: 64))
        
        dataSource.append(titleLbl)
        dataSource.append(dosageStrengthKey)
        dataSource.append(dosageUnitKey)
        dataSource.append(switchView)
        dataSource.append(chevronView)
        dataSource.append(continueButton)
        return dataSource
    }
}


//        do {
//            // Load from XIB
//            let cell = NibLoader<NibStackCell>().load()
//            views.append(cell)
//        }

