//
//  User.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
