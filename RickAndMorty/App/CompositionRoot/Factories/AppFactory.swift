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
        let homeFactory = HomeFactory()
        let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
        return homeCoordinator
    }
}
