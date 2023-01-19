//
//  ViewValue.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation
import UIKit

struct ViewValues {
    //MARK: - General
    static let widthScreen = UIScreen.main.bounds.width
    static let defaultCornerRadius: CGFloat = 10

    //MARK: - Home CollectionCell
    static let doublePadding: CGFloat = 20
    static var normalPadding: CGFloat { return doublePadding/2 }
    static let gradientLocations: [NSNumber] = [0.6, 0.9]
    
    //MARK: - CharactersView
    static let defaultHeightContainerCell: CGFloat = 100
    
    //MARK: - Spinner
    static let tagIdentifierSpinner = 123
    static let opacityContainerSpinner = 0.3
}
