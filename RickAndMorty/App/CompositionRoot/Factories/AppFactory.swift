//
//  AppFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit

protocol AppFactoryProtocol {
    func makeHomeCoordinator(navigation: UINavigationController) -> CoordinatorProtocol
}

struct AppFactory: AppFactoryProtocol {
    func makeHomeCoordinator(navigation: UINavigationController) -> CoordinatorProtocol {
        return FakeCoordinator(navigation: navigation)
    }
}

final class FakeCoordinator: CoordinatorProtocol {
    var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        
    }
    
    
}
