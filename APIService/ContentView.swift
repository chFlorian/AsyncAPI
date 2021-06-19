//
//  ContentView.swift
//  APIService
//
//  Created by florian schweizer on 19.06.21.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Todo] = []
    
    var body: some View {
        List(todos) { item in
            Text(item.title)
        }
        .task {
            do {
                todos = try await APIService
                    .fetchTodos()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
