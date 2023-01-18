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
        let viewController = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeViewCoordinatorProtocol {
    func didSelectedMenuCell(model: MenuItem) {
        switch model.title {
        case "characters":
            navigateToCharacters(urlList: model.url)
        case "episodes":
            navigateToEpisodes(urlList: model.url)
        case "locations":
            navigateToLocations(urlList: model.url)
        default:
            break
        }
    }
    
    private func navigateToCharacters(urlList: String) {
        print("Characters")
        let charactersCoordinator = homeFactory.makeCharactersCoordinator(navigation: navigation, urlList: urlList)
        charactersCoordinator.start()
    }
    
    private func navigateToEpisodes(urlList: String) {
        print("Episodes")
        let episodesCoordinator = homeFactory.makeEpisodesCoordinator(navigation: navigation, urlList: urlList)
        episodesCoordinator.start()

    }
    
    private func navigateToLocations(urlList: String) {
        print("Locations")
        let locationsCoordinator = homeFactory.makeLocationsCoordinator(navigation: navigation, urlList: urlList)
        locationsCoordinator.start()
    }
}
