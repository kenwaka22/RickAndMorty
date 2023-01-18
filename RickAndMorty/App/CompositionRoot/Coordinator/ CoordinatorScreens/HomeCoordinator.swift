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
        let vc = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeViewCoordinatorProtocol {
    func didSelectedMenuCell(model: MenuItem) {
        switch model.title {
        case "characters":
            navigateToCharacters(urlList: model.url)
        case "episodes":
            navigateToEpisodes()
        case "locations":
            navigateToLocations()
        default:
            break
        }
    }
    
    private func navigateToCharacters(urlList: String) {
        print("Characters")
        let charactersCoordinator = homeFactory.makeCharactersCoordinator(navigation: navigation, urlList: urlList)
        charactersCoordinator.start()
    }
    
    private func navigateToEpisodes() {
        print("Episodes")

    }
    
    private func navigateToLocations() {
        print("Locations")
    }
}
