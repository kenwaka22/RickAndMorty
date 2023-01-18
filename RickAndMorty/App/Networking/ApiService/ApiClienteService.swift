//
//  ApiClienteService.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

protocol ApiClienteServiceProtocol {
    func request<T: Decodable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void )
}

struct ApiClienteService: ApiClienteServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        //Validamos la URL
        guard let url = url else {
            completion(.failure(ApiError.urlError))
            return
        }
        
        //Creamos el request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Ejecutamos el request
        session.dataTask(with: request) { data, response, error in
            //Validamos el response, la data
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                completion(.failure(ApiError.unknownError))
                return
            }
            
            // Validamos el error del response
            switch response.statusCode {
            case HttpStatusResponse.ok: break
            case HttpStatusResponse.clientError: completion(.failure(ApiError.clienteError))
            case HttpStatusResponse.serverError: completion(.failure(ApiError.serverError))
            default: completion(.failure(ApiError.unknownError))
            }
            
            //Decodificamos el modelo
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(ApiError.decodingError))
            }
        }.resume()
    }
    
//    func request<T>(url: URL?, type: T.Type) async throws -> T where T : Decodable {
//        guard let url = url else { throw ApiError.urlError }
//        let (data: Data, httpResponse: URLResponse) = await try session.data(from: url)
//    }
//
//    private func makeRequest() {
//
//    }
}
