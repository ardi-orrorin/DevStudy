//
//  CustomPath.swift
//  Draw
//
//  Created by 유승철 on 1/11/24.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 0))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.closeSubpath()
//            path.addArc() : 반지름과 각도 값을 기반으로 호를 추가한다.
//            path.addCurve() : 주어진 큰점과 제어점을 사용하여 3차 베지어 곡선을 추가
//            path.addLine() : 지정된 포인트까지 직선을 추가
//            path.addLines() : 지정된 끝점들의 배열간에 직선을 추가
//            path.addQuadCurve() : 주어진 긑점에 제어점을 사용하여 2차 베지어 곡선을 추가
//            path.closeSubPath() : 끝점과 시작점을 연결하여 경로를 닫는다.

        }
        .fill(.blue)
        MyShape()
            .fill(.red)
            .frame(width: 360, height: 350)
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    CustomPath()
}
