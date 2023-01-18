//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigation: UINavigationController { get }
    func start()
}

final class AppCoordinator: CoordinatorProtocol {
    var navigation: UINavigationController
    private let appFactory: AppFactoryProtocol
    
    init(navigation: UINavigationController, appFactory: AppFactoryProtocol, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {
        let coordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

