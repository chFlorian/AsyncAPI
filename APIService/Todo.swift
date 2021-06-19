//
//  Todo.swift
//  APIService
//
//  Created by florian schweizer on 19.06.21.
//

import Foundation

struct Todo: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}
