//
//  ReuseIdentifierCell.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import Foundation

protocol ReuseProtocol {  }

extension ReuseProtocol {
    static var reuseIdentifier: String { String(describing: self) }
}
