//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var subtitle: String
    var angle: Double
    var color: Color
    
    init(loginMode:Bool){
        switch loginMode {
        case true:
            title = "To Do List"
            subtitle = "Get things done"
            angle = 15
            color = .red
            break
            
        case false:
            title = "Register"
            subtitle = "Start organizing todos"
            angle = -15
            color = .orange
            break
        }
    }
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
            }
            .padding(.top ,70)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 350)
        .offset(y: -150)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(loginMode: true)
    }
}
