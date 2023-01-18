//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation

protocol PropertyIterator {}

extension PropertyIterator {
    //La estructura tiene la capacidad de convertirse en un Diccionario
    func dictionaryProperties() -> [String: Any] {
        let mirror =  Mirror(reflecting: self)
        var dictionary = [String: Any]()
        
        mirror.children.forEach { property in
            dictionary[property.label ?? ""] = property.value
        }
        
        return dictionary
    }
}
