//
//  AppCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        
        childCoordinators.append(homeCoordinator)
        
        homeCoordinator.start()
        
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
    }
    
    
}
