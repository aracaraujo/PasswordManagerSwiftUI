//
//  CreateAccountView.swift
//  Password
//
//  Created by Arã Araújo on 1/25/23.
//

import SwiftUI
import Firebase

struct CreateAccountView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var path = NavigationPath()
   
    var body: some View {
        VStack {
            Group{
                HStack {
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 17, height: 20)
                    Text("Pass Security")
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                .padding(.top,50)
                Spacer()
                    .frame(height: 60)
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Spacer()
                    .frame(height: 50)
            }
            Group{
                Spacer()
                    .frame(height: 25)
                VStack(alignment: .leading) {
                    Text("Username")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    TextField("Enter Username", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .frame(width: 280)
                Spacer()
                    .frame(height: 25)
                VStack(alignment: .leading) {
                    Text("Password")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .frame(width: 280)
                Spacer()
                    .frame(height:30)
                Button("Register"){
                    register()
                }
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(.heavy)
                Spacer()
            }
            .navigationDestination(for: String.self) { view in
                if view == "ContentView" {
                    ContentView()
                }
            }
        }
        .background(
            Image("circuit3")
        )
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else{
                print("Registatrion success!")
                path.append("ContentView")
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
