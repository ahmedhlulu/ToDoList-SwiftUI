//
//  TLButton.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(color)
                    
                    Text(title)
                        .foregroundColor(.white)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .padding()
            }
        )
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "title", color: .blue, action: {print("hi")})
    }
}
