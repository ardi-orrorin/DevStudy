//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct GuideComponent: View {
    
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4){
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                } //: hstack
                Divider()
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }//: vstack
        }//: hstack
    }
}

#Preview {
    GuideComponent(
        title: "title", subtitle: "subtitle", description: "sdflsdivjlsdivjlsdijvlsdijvlsdijvlisdvjlsdijvilsdjvlisdjlvsdijvlis", icon: "heart.circle"
    )
}
