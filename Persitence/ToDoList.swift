//
//  ToDoList.swift
//  Persitence
//
//  Created by Jonas R. Gregory on 8/27/24.
//

import SwiftUI
import SwiftData

struct ToDoList: View {
   
    @Environment(\.modelContext) private var modelContext
    @Query var assignments: [Task]
    @State var enteredTask = ""
    @State var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter a Task", text: $enteredTask)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                    
                }
                List {
                    ForEach(assignments) { current in
                        Text(current.task)
                    }
                    .onDelete(perform: { indexSet in
                        deleteItems(indexSet)
                    })
                   
                }
            }
            
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        let assignment = Task(task: enteredTask)
                        modelContext.insert(assignment)
                        enteredTask = ""
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                    })
                }
            }
        }
    }
    
    func deleteItems(_ offsets: IndexSet) {
        for i in offsets {
            modelContext.delete(assignments[i])
        }
    }
}

@Model
class Task: Identifiable, PersistentModel, Observable {
    var task: String
    init(task: String) {
        self.task = task
    }
}

#Preview {
    ToDoList()
        .modelContainer(for: Task.self, inMemory: true)
}
