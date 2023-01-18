//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

protocol MenuRepositoryProtocol {
    func fetchMenuData() async throws -> [MenuItem]
}

struct MenuRepository: MenuRepositoryProtocol {
    
    let apiClientService: ApiClienteServiceProtocol
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        
        let url = URL(string: urlList)
        
        return try await  apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
}
