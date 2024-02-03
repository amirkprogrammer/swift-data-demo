//
//  ContentView.swift
//  swift-data-demo
//
//  Created by Amir Kabiri on 2/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var nameText = ""
    @State private var ageText = ""
    
    @State private var pickerSelection: Filter = .kids
    
    
    var body: some View {
        VStack {
            
            Picker("Type", selection: $pickerSelection) {
                Text("Kids")
                    .tag(Filter.kids)
                Text("Adults")
                    .tag(Filter.adults)
            }
            .pickerStyle(.segmented)
            
            PeopleListView(filter: pickerSelection)
            
            HStack {
                TextField("Name", text: $nameText)
                    .textFieldStyle(.roundedBorder)
                TextField("Age", text: $ageText)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    let person = Person()
                    person.age = Int(ageText)!
                    person.name = nameText
                    context.insert(person)
                    
                    // clear boxes
                    nameText = ""
                    ageText = ""
                }
            }
        }
        .padding()
    }
}

enum Filter {
    case kids
    case adults
}

#Preview {
    ContentView()
}
