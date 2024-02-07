//
//  RipeningStagesView.swift
//  Avocado
//
//  Created by 유승철 on 2/4/24.
//

import SwiftUI

struct RipeningStagesView: View {
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25) {
                    ForEach(ripeningData) { ripening in
                        RipeningView(ripening: ripening)
                    } //: loop
                } //: hstack
                .padding(.vertical)
                .padding(.horizontal, 25)
                
                Spacer()
            } //: vstack
        } //: scrollView
    }
}

#Preview {
    RipeningStagesView()
}
