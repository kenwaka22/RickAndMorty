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
    
    init()
    
    func start() {
        
    }
}

