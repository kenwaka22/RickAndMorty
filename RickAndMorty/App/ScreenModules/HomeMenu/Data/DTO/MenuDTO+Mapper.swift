//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation

extension MenuDTO {
    //Convertir el DTO al objeto de dominio
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = dictionary.value as? String ?? ""
            return MenuItem(title: title, url: url)
        }
    }
}
