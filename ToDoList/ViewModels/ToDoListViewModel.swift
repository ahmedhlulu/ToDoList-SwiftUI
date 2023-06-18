//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list items view
/// primary tab
class ToDoListViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(itemId: String){
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(itemId).delete()
    }
    
}
