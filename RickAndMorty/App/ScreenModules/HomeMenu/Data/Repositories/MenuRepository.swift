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
    func fetchMenuData() async throws -> [MenuItem] {
        [MenuItem(title: "Category", url: "")]
    }
}
