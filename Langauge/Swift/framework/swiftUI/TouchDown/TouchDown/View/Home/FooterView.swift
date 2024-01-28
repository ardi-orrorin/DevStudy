//
//  FooterView.swift
//  TouchDown
//
//  Created by 유승철 on 1/25/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            Text("we offer the..sd;fflskdf;osdkf;osdkf;ksdf;odsk;fodskf;odskf;osdkfo;skdof;ks;fodkfds;ofk;sdokf;osdfk;dsofk;odskf;osdkf;odskfosd;fokds;ofk;odskf.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
                .layoutPriority(/*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Text("Copyritght Orrorin\nAll right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        } //:VStack
        .padding()
    }
}

#Preview {
    FooterView()
}
