//
//  APIService.swift
//  APIService
//
//  Created by florian schweizer on 19.06.21.
//

import Foundation

enum APIService {
    static func fetch<T: Decodable>(from url: URL) async throws -> [T] {
        let (todoData, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode([T].self, from: todoData)
        
        return result
    }
    
    static func fetchTodos() async throws -> [Todo] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {
            return []
        }
        
        return try await APIService
            .fetch(from: url)
    }
}
