//
//  DetailsCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import Foundation
import UIKit


class DetailsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    var parentCoordinator: HomeCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = DetailsViewController()
        
        let viewModel = DetailsViewModel()
        
        viewModel.coordinator = self
        
        viewController.viewModel = viewModel
        
        viewController.view.backgroundColor = .red
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
