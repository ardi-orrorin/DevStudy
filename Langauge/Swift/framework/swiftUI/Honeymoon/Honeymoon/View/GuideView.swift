//
//  GuideView.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                intro()
                
                
                Spacer(minLength: 10)
                
                manual()
                
                Spacer(minLength: 10)
                
            } //: vstack
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
    
    func intro() -> some View {
        Group {
            Text("Get Started!")
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            Text("Discover and pick the perfect destination for your roimantic Honeymoon!")
                .lineLimit(nil)
                .multilineTextAlignment(.center)
        }
    }
    
    func manual() -> some View {
        VStack(alignment: .leading, spacing: 25) {
            GuideComponent(
                title: "Like",
                subtitle: "Swipe right",
                description: "Do you like this destination? Touch the screen and swipe right. It will be sasved to the favourites.",
                icon: "heart.circle"
            )
            
            GuideComponent(
                title: "Dismiss",
                subtitle: "Swipe left",
                description: "Do you like this destination? Touch the screen and swipe right. It will be sasved to the favourites.",
                icon: "xmark.circle"
            )
            
            GuideComponent(
                title: "Like",
                subtitle: "tap the button",
                description: "Do you like this destination? Touch the screen and swipe right. It will be sasved to the favourites.",
                icon: "checkmark.square"
            )
        }
    }
    
}

#Preview {
    GuideView()
}
