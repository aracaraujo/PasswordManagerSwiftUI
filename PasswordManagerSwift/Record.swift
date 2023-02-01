//
//  Record.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/30/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Record: Identifiable, Codable  {
    @DocumentID var id: String?
    var title = ""
    var login = ""
    var password = ""
    
    var dictionary: [String: Any]{
        return ["title": title, "login": login, "password": password]
    }
    
}
