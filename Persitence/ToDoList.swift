//
//  ToDoList.swift
//  Persitence
//
//  Created by Jonas R. Gregory on 8/27/24.
//

import SwiftUI
import SwiftData
struct ToDoList: View {
    @Environment(\.modelContext) var context
    @Query var tasks: [Task]
    var body: some View {
        VStack {
            
        }
    }
}
@Model
class Task {
    var task: String
    init(task: String) {
        self.task = task
    }
}

#Preview {
    ToDoList()
}
