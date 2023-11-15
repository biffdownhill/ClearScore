//
//  DonutScoreShape.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import SwiftUI

struct DonutScoreShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: rect.center,
            radius: rect.minLength/2,
            startAngle: .init(radians: .pi * 3/4),
            endAngle: .init(radians: .pi * 9/4),
            clockwise: false
        )
        return path
    }
}

extension CGRect {
    var center: CGPoint {
        return .init(x: midX, y: midY)
    }
    var minLength: CGFloat {
        return min(width, height)
    }
}
