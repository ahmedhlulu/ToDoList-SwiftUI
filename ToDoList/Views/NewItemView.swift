//
//  NewItemView.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresenting: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("TODO Title", text: $viewModel.title)
                    .frame(height: 40)
                    
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .frame(height: 100)
                
                TLButton(title: "Save", color: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresenting = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert("Error", isPresented: $viewModel.showAlert) {
                
            } message: {
                Text("Please fill in all fields and select due date that is today or newer")
            }

        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresenting: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
