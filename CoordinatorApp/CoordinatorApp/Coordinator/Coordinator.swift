//
//  Coordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    func start()
}
