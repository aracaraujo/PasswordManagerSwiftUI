//
//  ListView.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/27/23.
//

import SwiftUI
import Firebase

struct ListView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            Color.black
            List {
                Text("Password list go here")
            }
            .frame(width: .infinity, height: 50)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button("Sign Out"){
                    do{
                        try Auth.auth().signOut()
                        print("Log out successful")
                        dismiss()
                    }catch{
                        print("ERROR: Could not sign out!")
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // add item here
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
    }
}
