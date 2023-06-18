//
//  User.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
