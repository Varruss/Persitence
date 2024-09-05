//
//  College list.swift
//  Persitence
//
//  Created by Dylan Borgio on 8/27/24.
//

import SwiftUI

struct CollegeListView: View {
    @State private var colleges: [String] = []
    @State private var newCollege: String = ""
    
    private let collegesKey = "collegesKey"
    
    var body: some View {
        NavigationView {
            VStack {
            
                HStack {
                    TextField("Enter college name", text: $newCollege)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        addCollege()
                    }) {
                        Text("Add")
                            .bold()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
               
                List {
                    ForEach(colleges, id: \.self) { college in
                        Text(college)
                            .font(.custom("American Typewrighter", size: 18))
                            .padding()
                            .background(Color.cyan.opacity(0.1))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    .onDelete(perform: removeCollege)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("College List")
            
            .toolbar {
                EditButton()
            }
            .onAppear(perform: loadColleges)
        }
    }
    
    private func addCollege() {
        guard !newCollege.isEmpty else { return }
        colleges.append(newCollege)
        newCollege = ""
        saveColleges()
    }
    
    private func removeCollege(at offsets: IndexSet) {
        colleges.remove(atOffsets: offsets)
        saveColleges()
    }
    
    private func saveColleges() {
        UserDefaults.standard.set(colleges, forKey: collegesKey)
    }
    
    private func loadColleges() {
        if let savedColleges = UserDefaults.standard.stringArray(forKey: collegesKey) {
            colleges = savedColleges
        }
    }
}
#Preview {
    CollegeListView()
}


