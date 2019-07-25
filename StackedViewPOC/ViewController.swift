//
//  ViewController.swift
//  StackedViewPOC
//
//  Created by Majumdar, Amit (US - Bengaluru) on 22/07/19.
//  Copyright © 2019 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    private let stackScrollView = MPStackScrollView()
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareInterface()
    }
}

extension ViewController: ViewModelDelegate {
    
    func didSelectRow(_ row: MPKeyValueView, atIndexPath indexPath: Int) {
       let detailsController = DetailsViewController()
        navigationController?.pushViewController(detailsController, animated: true)
    }
    
    private func prepareInterface() {
        view.backgroundColor = viewModel.bgcolor
        stackScrollView.append(views: viewModel.dataSource)
        view.addSubview(stackScrollView)
        stackScrollView.fillSuperview()
        viewModel.delegate = self
    }
}
