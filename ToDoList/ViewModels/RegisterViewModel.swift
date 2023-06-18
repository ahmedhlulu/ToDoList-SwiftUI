//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init (){}
    
    private func insertUserRecord(id : String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {return}
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
                !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields \n don't add spaces."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter valid password."
            return false
        }
        
        return true
    }
}
