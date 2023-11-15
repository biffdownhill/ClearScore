//
//  DonutScoreView.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import SwiftUI

struct DonutScoreView: View {
    
    let viewModel: DonutScoreViewModel
    
    let lineWidth: CGFloat = 10
    
    init<DataSource: ICreditScoreDonutDataSource>(_ dataSource: DataSource) {
        self.viewModel = .init(dataSource)
    }
    
    var body: some View {
        ZStack {
            backgroundView
            
            progressView
            
            ProgressView()
                .progressViewStyle(.circular)
                .opacity(viewModel.isLoading ? 1 : 0)
            
            if let score = viewModel.score,
               let maxScore = viewModel.maxScore {
                textView(score: score, maxScore: maxScore)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(maxWidth: 250)
        .animation(.easeInOut(duration: 2), value: viewModel.progress)
    }
}

extension DonutScoreView {
    
    private var backgroundView: some View {
        DonutScoreShape()
            .stroke(
                style: .init(
                    lineWidth: lineWidth,
                    lineCap: .round
                )
            )
            .foregroundColor(.theme.text.opacity(0.05))
    }
    
    private var progressView: some View {
        DonutScoreShape()
            .trim(to: viewModel.progress ?? 0)
            .stroke(
                style: .init(
                    lineWidth: lineWidth,
                    lineCap: .round
                )
            )
            .foregroundColor(.theme.accent)
    }
    
    @ViewBuilder private func textView(score: Int, maxScore: Int) -> some View {
        VStack(spacing: 0) {
            Text("Your credit score is")
                .font(.theme.caption2)
            
            Text("\(score)")
                .font(.theme.value)
                .accessibilityIdentifier("DashboardDonutTextView")
            
            Text("out of \(maxScore)")
                .font(.theme.caption)
        }
    }
}


#Preview {
    DonutScoreView(DashboardViewModel(service: CreditScoreService()))
}
