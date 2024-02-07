//
//  SettingsView.swift
//  Avocado
//
//  Created by 유승철 on 2/4/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(
                        color: Color("ColorBlackTransparentLight"),
                        radius: 8,
                        x: 0, y: 4
                    )
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            } //: vstack
            .padding()
            
            Form {
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background refresh")
                    }
                } //: section
                
                Section(header: Text("Application")){
                    if enableNotification {
                        HStack {
                            Text("Product")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        
                        HStack {
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        
                        HStack {
                            Text("Developer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("John / Jane")
                        }
                        
                        HStack {
                            Text("Designer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Rebert Pertras")
                        }
                        
                        HStack {
                            Text("Website")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("url~~")
                        }
                        
                        HStack {
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Happy coding!")
                        }
                    }
                }//: section
            } //: form
        } //: vstack
        .frame(maxWidth: 640)
    }
}

#Preview {
    SettingsView()
}
