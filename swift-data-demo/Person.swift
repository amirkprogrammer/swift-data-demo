//
//  Person.swift
//  swift-data-demo
//
//  Created by Amir Kabiri on 2/3/24.
//

import Foundation
import SwiftData

@Model
class Person: Identifiable {
    var id: String
    var age: Int = 0
    var name: String = ""
    
    init() {
        id = UUID().uuidString
    }
}
