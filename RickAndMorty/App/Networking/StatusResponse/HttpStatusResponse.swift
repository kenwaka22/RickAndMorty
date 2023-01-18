//
//  HttpStatusResponse.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import Foundation

enum HttpStatusResponse {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
