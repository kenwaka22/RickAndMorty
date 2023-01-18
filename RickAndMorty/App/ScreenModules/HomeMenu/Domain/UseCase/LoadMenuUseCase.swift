//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

protocol LoadMenuUseCaseProtocol {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCase: LoadMenuUseCaseProtocol {
    
    let menuRepository: MenuRepositoryProtocol
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
