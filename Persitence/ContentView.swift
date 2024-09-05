//
//  ContentView.swift
//  Persitence
//
//  Created by Jonas R. Gregory on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink("Make A To Do List", destination: ToDoList())
                Text("Or Perhaps")
                    .font(.title)
                //NavigationLink("Make A List Of Colleges", destination: <#T##() -> View#>)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
