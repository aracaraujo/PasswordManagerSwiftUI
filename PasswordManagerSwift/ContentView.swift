//
//  ContentView.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/25/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var path = NavigationPath()
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                Group{
                    Spacer()
                        .frame(height: 100)
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 80, height: 100)
                    Text("Pass Security")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .kerning(1)
                    Spacer()
                        .frame(height: 50)
                }
                Group{
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        TextField("Enter Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
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
                            .textInputAutocapitalization(.never)
                    }
                    .frame(width: 280)
                    Spacer()
                        .frame(height: 25)
                    HStack{
                        Button("Login"){
                            login()
                        }
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .fontWeight(.heavy)
                        Spacer()
                            .frame(width: 50)
                        Button("Sign Up"){
                            register()
                        }
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .fontWeight(.heavy)
                    }
                    Spacer()
                }
            }
            .background(
                Image("circuit3")
            )
            .navigationDestination(for: String.self) { view in
                if view == "ListView"{
                    ListView()
                }
            }
        }
        .alert(alertMessage, isPresented: $showAlert){
            Button("OK", role: .cancel){}
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("SIGN UP ERROR: \(error.localizedDescription)")
                alertMessage = "SIGN UP ERROR: \(error.localizedDescription)"
                showAlert = true
            }else{
                print("Registatrion success!")
                alertMessage = "Account Created Successfully!"
                showAlert = true
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("LOGIN ERROR: \(error.localizedDescription)")
                alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                showAlert = true
            }else{
                print("Login Successful")
                path.append("ListView")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
