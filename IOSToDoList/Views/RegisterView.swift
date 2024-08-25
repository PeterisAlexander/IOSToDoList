//
//  RegisterView.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title:"Register",
                       subtitle:"Start organizing todos", angle: -15, background: Color.orange)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    background: Color.green
                ) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y : -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
