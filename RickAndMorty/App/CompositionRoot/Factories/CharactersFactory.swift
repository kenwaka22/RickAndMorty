//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit
import Combine

protocol CharactersFactoryProtocol {
    func makeModule(coordinator: CharactersViewCoordinatorProtocol) -> UIViewController
}

struct CharactersFactory: CharactersFactoryProtocol {
    func makeModule(coordinator: CharactersViewCoordinatorProtocol) -> UIViewController {
        //Inyectamos las dependencias
        let state = PassthroughSubject<StateController, Never>()
        let viewController = CharactersView(coordinator: coordinator)
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        viewController.title = "Characters"
        return viewController
    }
}
