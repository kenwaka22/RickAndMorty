//
//  LocationsCoordinate.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation
import UIKit

final class LocationsCoordinator: CoordinatorProtocol {
    var navigation: UINavigationController
    private let factory: LocationsFactoryProtocol
    
    init(navigation: UINavigationController, factory: LocationsFactoryProtocol) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let viewController = factory.makeModule(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(viewController, animated: true)
    }
}

extension LocationsCoordinator: LocationsViewCoordinatorProtocol {  }
