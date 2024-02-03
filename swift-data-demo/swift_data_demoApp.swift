//
//  swift_data_demoApp.swift
//  swift-data-demo
//
//  Created by Amir Kabiri on 2/3/24.
//

import SwiftUI
import SwiftData

@main
struct swift_data_demoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Person.self)
        }
    }
}
