//
//  CrossStackView.swift
//  Stack
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct CrossStackView: View {
    var body: some View {
        HStack(alignment: .crossAlignment, spacing: 20){
            Circle()
                .foregroundColor(.purple)
                .alignmentGuide(.crossAlignment, computeValue: { d in
                    d[VerticalAlignment.bottom]
                })
                .frame(width: 100, height: 100)
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .alignmentGuide(.crossAlignment, computeValue: { d in
                        d[VerticalAlignment.bottom]
                    })
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
            }
        }
    }
}


extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}


#Preview {
    CrossStackView()
}
