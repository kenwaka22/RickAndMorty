//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Combine
import Foundation

protocol HomeViewModelProtocol {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> HomeItemCellViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuItem
}

final class HomeViewModel: HomeViewModelProtocol {
    var state: PassthroughSubject<StateController, Never>
    var menuItemsCount: Int {
        menuItems.count
    }
    private let loadMenuUseCase: LoadMenuUseCaseProtocol
    private var menuItems = [MenuItem]()
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCaseProtocol) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await loadMenuUseCase.execute()
            switch result {
            case.success(let menuItems):
                self.menuItems = menuItems
                state.send(.success)
            case.failure(let error):
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> HomeItemCellViewModel {
        let menuItem = menuItems[indexPath.row]
        return HomeItemCellViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuItem {
        return menuItems[indexPath.row]
    }
    
    
}
