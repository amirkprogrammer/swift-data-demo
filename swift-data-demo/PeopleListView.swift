//
//  PeopleListView.swift
//  swift-data-demo
//
//  Created by Amir Kabiri on 2/3/24.
//

import SwiftUI
import SwiftData

struct PeopleListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(filter: #Predicate<Person> { person in
    person.age < 20
    }, sort: \Person.name, order: .reverse)
    private var people: [Person]
    
    var body: some View {
        List(people) { p in
            HStack {
                Text(p.name)
                Spacer()
                Text("Age: \(p.age)")
            }
            .swipeActions {
                Button("Delete", role: .destructive) {
                    context.delete(p)
                }
            }
        }
    }
    
    init(filter: Filter) {
        // based on the filter, set the predicate
        if filter == .kids {
            _people = Query(filter: #Predicate<Person> { person in
                person.age < 20
            }, sort: \Person.age)
        }
        else if filter == .adults {
            _people = Query(filter: #Predicate<Person> { person in
                person.age >= 20
            }, sort: \Person.age)
        }
        
    }
}
