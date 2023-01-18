//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation
import UIKit

final class CharactersCoordinator: CoordinatorProtocol {
    var navigation: UINavigationController
    private let factory: CharactersFactoryProtocol
    
    init(navigation: UINavigationController, factory: CharactersFactoryProtocol) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let viewController = factory.makeModule(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(viewController, animated: true)
    }
}

extension CharactersCoordinator: CharactersViewCoordinatorProtocol {
    func didSelectedCharacterCell(model: String) {
        print("Navigate to detail")
    }
}
