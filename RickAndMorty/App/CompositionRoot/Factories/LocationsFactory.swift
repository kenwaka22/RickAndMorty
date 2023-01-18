//
//  LocationsFactory.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit
import Combine

protocol LocationsFactoryProtocol {
    func makeModule(coordinator: LocationsViewCoordinatorProtocol) -> UIViewController
}

struct LocationsFactory: LocationsFactoryProtocol {
    func makeModule(coordinator: LocationsViewCoordinatorProtocol) -> UIViewController {
        //Inyectamos las dependencias
        let state = PassthroughSubject<StateController, Never>()
        let viewController = LocationsView(coordinator: coordinator)
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        viewController.title = "Locations"
        return viewController
    }
}
