//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit
import Combine

protocol HomeFactoryProtocol {
    func makeModule() -> UIViewController
}

struct HomeFactory: HomeFactoryProtocol {
    func makeModule() -> UIViewController {
        //Inyectamos las dependencias
        let menuRepository = MenuRepository()
        let loadUseCase = LoadMenuUseCase(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let viewModel: HomeViewModelProtocol = HomeViewModel(state: state, loadMenuUseCase: loadUseCase)
        let viewController = HomeView(viewModel: viewModel)
        viewController.title = "Rick and Morty"
        
        return viewController
    }
}
