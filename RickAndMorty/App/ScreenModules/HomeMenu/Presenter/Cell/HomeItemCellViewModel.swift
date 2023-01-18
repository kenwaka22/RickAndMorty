//
//  HomeItemCellViewModel.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

struct HomeItemCellViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    
    var imageName: String {
        menuItem.title
    }
}
