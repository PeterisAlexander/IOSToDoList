//
//  TLButton.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action : () -> Void
    
    var body: some View {
        Button{
            // Actions
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: Color.pink){
        // Action
    }
}
