//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit
import Combine

protocol HomeFactoryProtocol {
    func makeModule(coordinator: HomeViewCoordinatorProtocol) -> UIViewController
    func makeCharactersCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol
    func makeLocationsCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol
    func makeEpisodesCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol

}

struct HomeFactory: HomeFactoryProtocol {
    func makeModule(coordinator: HomeViewCoordinatorProtocol) -> UIViewController {
        //Inyectamos las dependencias
        let apiClientService = ApiClienteService()
        let menuRepository = MenuRepository(apiClientService: apiClientService , urlList: EndPoing.baseURL)
        let loadUseCase = LoadMenuUseCase(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let viewModel: HomeViewModelProtocol = HomeViewModel(state: state, loadMenuUseCase: loadUseCase)
        
        let viewController = HomeView(viewModel: viewModel, coordinator: coordinator)
        viewController.title = AppLocalized.appName
        
        return viewController
    }
    
    func makeCharactersCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol {
        let charactersFactory = CharactersFactory()
        let charactersCoordinator = CharactersCoordinator(navigation: navigation, factory: charactersFactory)
        return charactersCoordinator
    }
    
    func makeLocationsCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol {
        let locationsFactory = LocationsFactory()
        let locationsCoordinator = LocationsCoordinator(navigation: navigation, factory: locationsFactory)
        return locationsCoordinator
    }
    
    func makeEpisodesCoordinator(navigation: UINavigationController, urlList: String) -> CoordinatorProtocol {
        let episodesFactory = EpisodesFactory()
        let episodesCoordinator = EpisodesCoordinator(navigation: navigation, factory: episodesFactory)
        return episodesCoordinator
    }
}
