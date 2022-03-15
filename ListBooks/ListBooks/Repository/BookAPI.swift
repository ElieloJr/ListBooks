//
//  BookAPI.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import Foundation

class BookAPI {
    static let shared = BookAPI()
    
    func getBook(completion: @escaping (Result<BookAPIResponse, Error>) -> Void) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=search+terms") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(BookAPIResponse.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
