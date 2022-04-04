//
//  HomeViewModel.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import Foundation

class HomeViewModel {
    let title = "Home"
    
    var coordinator: HomeCoordinator?
    
    func tapDetails() {
        coordinator?.details()
    }
}
