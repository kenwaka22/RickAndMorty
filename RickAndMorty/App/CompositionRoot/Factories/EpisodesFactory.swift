//
//  EpisodesFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit
import Combine

protocol EpisodesFactoryProtocol {
    func makeModule(coordinator: EpisodesViewCoordinatorProtocol) -> UIViewController
}

struct EpisodesFactory: EpisodesFactoryProtocol {
    func makeModule(coordinator: EpisodesViewCoordinatorProtocol) -> UIViewController {
        //Inyectamos las dependencias
        let state = PassthroughSubject<StateController, Never>()
        let viewController = EpisodesView(coordinator: coordinator)
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        viewController.title = "Episodes"
        return viewController
    }
}
