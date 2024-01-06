//
//  ZstackVeiw.swift
//  Stack
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct ZstackVeiw: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in d[.trailing]
                 })
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in d[.bottom]
                })
                .frame(width: 100, height: 100)
            
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in d[HorizontalAlignment.center]
                 })
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in d[VerticalAlignment.top]
                })
                .frame(width: 100, height: 100)
            
            Circle()
                .foregroundColor(.orange)
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in d[HorizontalAlignment.leading]
                 })
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in d[VerticalAlignment.bottom]
                })
                .frame(width: 100, height: 100)
        }
    }
}


extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}


#Preview {
    ZstackVeiw()
}
