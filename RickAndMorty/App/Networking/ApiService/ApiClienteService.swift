//
//  ApiClienteService.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 17/01/23.
//

import Foundation

protocol ApiClienteServiceProtocol {
    func requestWithEscaping<T: Decodable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void )
    
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}

struct ApiClienteService: ApiClienteServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    //MARK: - Reques with Closure
    func requestWithEscaping<T>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
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
    
    //MARK: - Reques with async
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
        guard let url = url else { throw ApiError.urlError }
        return try await makeRequest(url: url)
    }
    
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
        let request = try await session.data(from: url)
        return try validateResponse(request:request)
    }
    
    private func validateResponse<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse)
    ) throws -> T {
        guard let httpResponse = request.httpResponse as? HTTPURLResponse
        else { throw ApiError.unknownError }
        
        switch httpResponse.statusCode {
        case HttpStatusResponse.ok:
            return try decodeModel(data: request.data)
        case HttpStatusResponse.clientError:
            throw ApiError.clienteError
        case HttpStatusResponse.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data)
        guard let model = model else { throw ApiError.decodingError }
        return model
    }
}
