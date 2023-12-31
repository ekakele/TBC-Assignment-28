//
//  NetworkManager.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import SwiftUI

final class NetworkManager {
    // MARK: - Properties
    private let baseURL: String
    private let endpoint = ""
    
    // MARK: - Init
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    // MARK: - Methods
    public func fetchData<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = "\(baseURL + endpoint)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let dataResponse = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataResponse))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}
