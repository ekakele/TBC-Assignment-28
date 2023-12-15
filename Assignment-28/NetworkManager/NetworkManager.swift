//
//  NetworkManager.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import SwiftUI

final class NetworkManager {
    //    static let shared = NetworkManager()
    
    private let baseURL: String
    private let endpoint = ""
    
    //    private init() {}
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
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
    
    
    // MARK: - Download Image
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let urlString = "\(baseURL + endpoint)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }.resume()
    }
}
