//
//  HomeCoordinator.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    var navigation: UINavigationController
    private let homeFactory: HomeFactoryProtocol 
    
    init(navigation: UINavigationController, homeFactory: HomeFactoryProtocol) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let vc = homeFactory.makeModule()
        navigation.pushViewController(vc, animated: true)
    }
    
    
}
