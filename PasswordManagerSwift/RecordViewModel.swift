//
//  RecordViewModel.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/30/23.
//

import Foundation
import FirebaseFirestore

class RecordViewModel: ObservableObject {
    @Published var record = Record()
    
    func saveRecord(record: Record) async -> Bool{
        let db = Firestore.firestore()
        let email = UserDefaults.standard.string(forKey: "email")
        if let id = record.id{
            do {
                try await db.collection("\(String(describing: email))").document(id).setData(record.dictionary)
                print("Data updated successfully")
                return true
            } catch{
                print("ERROR: Couldn't update data \(error.localizedDescription)")
                return false
            }
        } else{
            do{
                try await db.collection("\(String(describing: email))").addDocument(data: record.dictionary)
                print("Data added successfully")
                return true
            } catch{
                print("ERROR: Couldn't create record \(error.localizedDescription)")
                return false
            }
        }
    }
}
