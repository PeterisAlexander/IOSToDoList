//
//  IOSToDoListApp.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//
import FirebaseCore
import SwiftUI

@main
struct IOSToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
