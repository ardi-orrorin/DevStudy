//
//  DishesView.swift
//  Avocado
//
//  Created by 유승철 on 2/4/24.
//

import SwiftUI



struct DishesView: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image("icon-toasts")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Toasts")
                }//: hstack
                
                Divider()
                
                HStack {
                    Image("icon-tacos")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Tacos")
                }//: hstack
                
                Divider()
                
                HStack {
                    Image("icon-salads")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Salads")
                }//: hstack
                
                Divider()
                
                HStack {
                    Image("icon-halfavo")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Spreads")
                }//: hstack
            }//: vstack
            
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }//: vstack
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Guacamole")
                    Spacer()
                    Image("icon-guacamole")
                        .resizable()
                        .modifier(IconModifier())
                }//: hstack
                
                Divider()
                
                HStack {
                    Text("Sandwich")
                    Spacer()
                    Image("icon-sandwiches")
                        .resizable()
                        .modifier(IconModifier())
                }//: hstack
                
                Divider()
                
                HStack {
                    Text("Soup")
                    Spacer()
                    Image("icon-soup")
                        .resizable()
                        .modifier(IconModifier())
                }//: hstack
                
                Divider()
                
                HStack {
                    Text("Smoothie")
                    Spacer()
                    Image("icon-smoothies")
                        .resizable()
                        .modifier(IconModifier())
                }//: hstack
                
            }//: vstack
            
            
        } //: Hstack
        .font(.system(.callout, design: .serif))
        .foregroundColor(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60 , alignment: .center)
    }
}

#Preview {
    DishesView()
        .previewLayout(.fixed(width: 414, height: 280))
}
