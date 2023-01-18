//
//  ApiError.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

enum ApiError: Error {
    case clienteError
    case serverError
    case unknownError
    case urlError
    case decodingError
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .clienteError:
            return NSLocalizedString("Client error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        case .unknownError:
            return NSLocalizedString("Unkown error", comment: "")
        case .urlError:
            return NSLocalizedString("URL error", comment: "")
        case .decodingError:
            return NSLocalizedString("Decoding error", comment: "")

        }
    }
}
