//
//  CreditDetailsDistributionView.swift
//  ClearScore
//
//  Created by Edward Downhill on 15/11/2023.
//

import SwiftUI

struct CreditDetailsDistributionView: View {
    
    let viewModel: CreditDetailsDistributionViewModel
    
    let lineWidth: CGFloat = 10
    
    init(shortTermDebt: Int,
         shortTermCreditLimit: Int?,
         longTermDebt: Int,
         longTermCreditLimit: Int?){
        self.viewModel = .init(
            shortTermDebt: shortTermDebt,
            shortTermCreditLimit: shortTermCreditLimit,
            longTermDebt: longTermDebt,
            longTermCreditLimit: longTermCreditLimit
        )
    }
    
    var body: some View {
        ZStack {
            CircleShortTermShape(overallFraction: viewModel.shortTermFraction)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.theme.text.opacity(0.05))
            CircleLongTermShape(overallFraction: viewModel.longTermFraction)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.theme.text.opacity(0.05))
            
            CircleShortTermShape(overallFraction: viewModel.shortTermFraction)
                .trim(to: viewModel.shortTermUtilizationFraction)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.theme.yellow)
            CircleLongTermShape(overallFraction: viewModel.longTermFraction)
                .trim(to: viewModel.longTermUtilizationFraction)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.theme.orange)
        }
    }
}

fileprivate struct CircleShortTermShape: Shape {
    let overallFraction: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: rect.center,
            radius: rect.minLength/2,
            startAngle: .init(radians: -.pi/2),
            endAngle: .init(radians: (-.pi/2) - (.pi*2*overallFraction)),
            clockwise: true
        )
        return path
    }
}
fileprivate struct CircleLongTermShape: Shape {
    let overallFraction: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: rect.center,
            radius: rect.minLength/2,
            startAngle: .init(radians: -.pi/2),
            endAngle: .init(radians: (-.pi/2) + (.pi*2*overallFraction)),
            clockwise: false
        )
        return path
    }
}

#Preview {
    CreditDetailsDistributionView(
        shortTermDebt: 13758,
        shortTermCreditLimit: 30600,
        longTermDebt: 24682,
        longTermCreditLimit: nil
    )
}
