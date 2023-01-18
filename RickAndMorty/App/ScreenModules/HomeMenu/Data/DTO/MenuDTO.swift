//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation

//Los DTO deben ajustarse al protocolo Decodable

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
