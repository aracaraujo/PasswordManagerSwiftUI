//
//  LoginView.swift
//  Password
//
//  Created by Arã Araújo on 1/25/23.
//

import SwiftUI

struct LoginView: View {
    
    
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Group{
                Spacer()
                    .frame(height: 150)
                HStack {
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 40)
                    Text("Pass Security")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                Spacer()
                    .frame(height: 50)
                Text("Log in to access your secure vault")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Spacer()
                    .frame(height: 50)
            }
            Group{
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
                    .frame(height: 25)
                Button("Login"){
                }
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(.heavy)
                Spacer()
            }
        }
        .background(
            Image("circuit3")
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
