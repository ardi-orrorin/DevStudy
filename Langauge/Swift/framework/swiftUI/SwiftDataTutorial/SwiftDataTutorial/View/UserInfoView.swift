//
//  UserInfoView.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/20/24.
//

import SwiftUI

struct UserInfoView: View {
    
    var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            HStack {
                Text("Name : ")
                Text(user.name)
            }
            .font(.system(size: 22, design: .rounded))
            

            HStack {
                Text("Phone :")
                Text(user.phone)
            }
            

            HStack {
                Text("Website : ")
                Link(destination: URL(string: user.website)!) {
                    Text(user.website)
                }
            }
            
            Spacer()
            
            if user.address != nil {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Address")
                        .font(.system(size: 32, design: .monospaced))
                        .bold()
                        .italic()
                        .foregroundStyle(.brown)
                    HStack {
                        Text("City : ")
                        Text(user.address?.city ?? "")
                    }
                    HStack {
                        Text("Street : ")
                        Text(user.address?.street ?? "")
                    }
                    
                    HStack {
                        Text("Zipcode : ")
                        Text(user.address?.zipcode ?? "")
                    }
                }
                
            } //: user..address
            
            if user.company != nil {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Company")
                        .font(.system(size: 32, design: .monospaced))
                        .bold()
                        .italic()
                        .foregroundStyle(.brown)
                    HStack {
                        Text("bs : ")
                        Text(user.company?.bs ?? "")
                    }
                    
                    HStack {
                        Text("CatchPhrase : ")
                        Text(user.company?.catchPhrase ?? "")
                    }
                }
            } //: user.company
        } //: vstack
        .padding()
    }
}

//#Preview {
//    UserInfoView()
//}
