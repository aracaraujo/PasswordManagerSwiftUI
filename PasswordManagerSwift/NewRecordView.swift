//
//  NewRecordView.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/28/23.
//

import SwiftUI

struct NewRecordView: View {
    @EnvironmentObject var recordVM: RecordViewModel
    @State var record: Record
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack() {
            Spacer()
            Group{
                Text("Title")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title)
                TextField("Title", text: $record.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                Text("Email or Username")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title)
                TextField("Email or Username", text: $record.login)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                Text("Password")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title)
                SecureTextField(text: $record.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer()
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(
            LinearGradient(
                gradient: Gradient(colors:
                [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]),
                startPoint: .leading,
                endPoint: .trailing),
            for: .navigationBar)
        .toolbar {
           ToolbarItem(placement: .navigationBarLeading){
               Button("Cancel"){
                   dismiss()
               }
               .foregroundColor(.white)
               .fontWeight(.heavy)
           }
            ToolbarItem(placement: .principal){
                HStack{
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 16, height: 20)
                    Text("New Record")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
           ToolbarItem(placement: .navigationBarTrailing) {
               Button("Save"){
                   Task{
                       let success = await recordVM.saveRecord(record: record)
                       if success {
                           dismiss()
                       } else {
                           print("Error saving record")
                       }
                   }
               }
               .foregroundColor(.white)
               .fontWeight(.heavy)
//               .padding(.top,50)
           }
       }
    }
}

struct NewRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            NewRecordView(record: Record())
                .environmentObject(RecordViewModel())
        }
    }
}


//[Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]
