//
//  NetworkingManager.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

class NetworkingManager: NSObject {
    
    // MARK: - Properties
    public static let shared = NetworkingManager()
    let urlSession = URLSession.shared
    
    public enum APIServiceError: Error {
        case apiError
        case invalidResponse
        case decodeError
    }
    
    // MARK: - APIRequest
    private func fetchResources(url: URL, completion: @escaping (Result<[Sucursal], APIServiceError>) -> Void) {
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try JSONDecoder().decode(jsonTiendas.self, from: data).responseArray
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure:
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    public func fetchSucursales(result: @escaping (Result<[Sucursal], APIServiceError>) -> Void) {
        let stringURL = UrlConstants.fetchSucursales()
        guard let url = URL(string: stringURL) else { return }
        fetchResources(url: url, completion: result)
    }
}
