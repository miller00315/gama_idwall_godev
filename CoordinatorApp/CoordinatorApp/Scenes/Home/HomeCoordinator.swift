//
//  HomeCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        
        homeViewController.view.backgroundColor = .orange
        
        let viewModel = HomeViewModel()
        
        viewModel.coordinator = self
        
        homeViewController.viewModel = viewModel
        
        navigationController.setViewControllers([homeViewController], animated: true)
    }
    
    func details() {
        let detailCoordinator = DetailsCoordinator(navigationController: navigationController)
        
        detailCoordinator.parentCoordinator = self
        
        childCoordinators.append(detailCoordinator)
        
        detailCoordinator.start()
    }
}
