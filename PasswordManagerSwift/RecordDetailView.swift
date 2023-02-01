//
//  RecordDetailView.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/31/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct RecordDetailView: View {
    @State var record: Record
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack() {
            Spacer()
            Group{
                Text("\(record.title)")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(.vertical, 25)
                Text("Email or Username")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title3)
                TextField("Email or Username", text: $record.login)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                Divider()
                Text("Password")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .fontWeight(.semibold)
                    .font(.title3)
                SecureTextField(text: $record.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Spacer()
            Spacer()
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(
            LinearGradient(
                gradient: Gradient(colors:
                [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]),
                startPoint: .leading,
                endPoint: .trailing),
            for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal){
                HStack{
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 16, height: 20)
                    Text("Record")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            ToolbarItemGroup(placement: .bottomBar){
                Spacer()
                Button {
                    Task{
                        let success = await deleteRecord(record: record)
                        if success {
                            dismiss()
                        }
                    }
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                }
            }
       }
    }
    
    func deleteRecord(record: Record) async -> Bool {
        let db = Firestore.firestore()
        guard let recordID = record.id else {
            print("ERROR: Record doesn't exist")
            return false
        }
        do {
            try await db.collection("\(String(describing: UserDefaults.standard.string(forKey: "email")))").document(recordID).delete()
            print("Record deleted successfully")
            return true
        } catch {
            print("ERROR: Record couldn't be deleted \(error.localizedDescription)")
            return false
        }

    }
}

struct RecordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            RecordDetailView(record: Record())
        }
    }
}


