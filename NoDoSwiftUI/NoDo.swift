//
//  NoDo.swift
//  NoDoSwiftUI
//
//  Created by Gabriel on 2/19/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()

struct NoDo : Identifiable,Codable {
    let id = UUID()
    var name = "Hello"
    var isDone : Bool = false
    private let dateAdded = Date()
    var dateString : String {
        dateFormatter.dateFormat = "MMM d YYYY h:mm a"
        return dateFormatter.string(from: dateAdded)
    }
}
