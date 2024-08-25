//
//  MainViewViewModel.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId : String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
