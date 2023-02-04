//
//  ListView.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/27/23.
//
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ListView: View {
    @FirestoreQuery(collectionPath: "\(String(describing: UserDefaults.standard.string(forKey: "email")))") var records: [Record]
    @State private var sheetIsPresented = false
    @Environment(\.dismiss) private var dismiss
    @State private var path = NavigationPath()
    @State private var showAddNew = false
    var body: some View {
        VStack{
            Spacer()
            List(records){ record in
                NavigationLink {
                    RecordDetailView(record: record)
                } label: {
                    Text(record.title)
                        .font(.title2)
                }
            }
            .listStyle(.inset)
            .foregroundColor(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
            Spacer()
            Spacer()
        }
        .scrollContentBackground(.hidden)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(
            LinearGradient(
                gradient: Gradient(colors:
                [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]),
                startPoint: .leading,
                endPoint: .trailing),
            for: .navigationBar)
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
                .foregroundColor(.white)
                .fontWeight(.heavy)
            }
            ToolbarItem(placement: .principal){
                HStack{
                    Image(systemName: "shield.righthalf.filled")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 16, height: 20)
                    Text("All Records")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddNew.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationDestination(isPresented: $showAddNew){
            NewRecordView(record: Record())
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
