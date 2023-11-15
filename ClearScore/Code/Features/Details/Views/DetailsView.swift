//
//  DetailsView.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var isPresented: Bool
    let viewModel: DetailsViewModel
    
    init<DataSource: ICreditScoreDonutDataSource>(_ dataSource: DataSource, isPresented: Binding<Bool>) {
        self.viewModel = .init(dataSource)
        self._isPresented = isPresented
    }
    
    var body: some View {
        CustomNavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        scoreView
                        
                        HStack {
                            Spacer()
                            Text("\(viewModel.daysUntilNextReport ?? 0) days until next report")
                                .font(.theme.caption2)
                                .foregroundColor(.theme.textSeconary)
                        }
                        .padding(10)
                        
                        creditView
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .padding(.vertical, 20)
                }
                .customToolbar(isPresented: $isPresented)
                .navigationTitle("Overview")
            }
        }
    }
}

extension DetailsView {
    
    private var scoreView: some View {
        VStack(spacing: 0) {
            Text("Your score")
                .font(.theme.headline)
                .foregroundColor(.theme.textSeconary)
            
            Text(viewModel.scoreString)
                .font(.theme.value)
                .opacity(viewModel.score == nil ? 0 : 1)
                .overlay {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
                .padding(.vertical, 5)
                .accessibilityIdentifier("DetailsScoreView")
            
            ProgressView(value: viewModel.progress ?? 0)
                .frame(maxWidth: 150)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
            
            Text(viewModel.equifaxScoreBandDescription ?? "-")
                .font(.theme.title2)
            
            HStack {
                Text("Score Band")
                    .font(.theme.caption)
                
                Text(viewModel.equifaxScoreBand.toString() ?? "-")
                    .font(.theme.headline)
                    .padding(10)
                    .background(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.theme.accent)
                    )
            }
            .frame(maxWidth: 150)
        }
        .padding(.vertical, 10)
        .animation(.default, value: viewModel.score)
    }
    
    private var creditView: some View {
        VStack(spacing: 20){
            Text("Credit")
                .font(.theme.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
            
            HStack(spacing: 20){
                Text(viewModel.currentShortTermDebt?.toCurrencyString() ?? "-")
                    .font(.theme.title3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .frame(maxWidth: .infinity)
                
                creditDistributionView
                    .overlay {
                        viewModel.creditUtilizationDirectionFlag?.image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }
                
                Text(viewModel.currentLongTermDebt?.toCurrencyString() ?? "-")
                    .font(.theme.title3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .frame(maxWidth: .infinity)
            }
            
            Divider().padding(.horizontal, 20)
            
            HStack(spacing: 20) {
                Text("Short")
                    .font(.theme.title)
                    .frame(maxWidth: .infinity)
                
                Text("Term")
                    .font(.theme.headline)
                    .foregroundColor(.theme.textSeconary)
                    .frame(maxWidth: .infinity)
                
                Text("Long")
                    .font(.theme.title)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
            Divider().padding(.horizontal, 20)
            
            listRow(
                title: "Limit",
                leadingString: viewModel.currentShortTermCreditLimit?.toCurrencyString() ?? "-",
                trailingString: viewModel.currentLongTermCreditLimit?.toCurrencyString() ?? "-"
            )
            
            listRow(
                title: "Non-Promotional",
                leadingString: viewModel.currentShortTermNonPromotionalDebt?.toCurrencyString() ?? "-",
                trailingString: viewModel.currentLongTermNonPromotionalDebt?.toCurrencyString() ?? "-"
            )
            
            listRow(
                title: "Utilization",
                leadingString: viewModel.currentShortTermCreditUtilisation?.toPercentageString() ?? "-",
                trailingString: viewModel.currentLongTermCreditUtilisation?.toPercentageString() ?? "-"
            )
            
            listRow(
                title: "Change",
                leadingString: viewModel.changeInShortTermDebt?.toChangeCurrencyString() ?? "-",
                trailingString: viewModel.changeInLongTermDebt?.toChangeCurrencyString() ?? "-"
            )
        }
        .animation(.default, value: viewModel.score)
    }
    
    private var creditDistributionView: some View {
        Group {
            if let shortTermDebt = viewModel.currentShortTermDebt, let longTermDebt = viewModel.currentLongTermDebt {
                CreditDetailsDistributionView(
                    shortTermDebt: shortTermDebt,
                    shortTermCreditLimit: viewModel.currentShortTermCreditLimit,
                    longTermDebt: longTermDebt,
                    longTermCreditLimit: viewModel.currentLongTermCreditLimit
                )
            }else{
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .padding(10)
        .frame(width: 80, height: 80)
    }
    
    @ViewBuilder private func listRow(title: String, leadingString: String, trailingString: String) -> some View {
        HStack(spacing: 20) {
            Text(leadingString)
                .font(.theme.subheadline)
                .frame(maxWidth: .infinity)
            
            Text(title)
                .font(.theme.subheadline)
                .foregroundColor(.theme.textSeconary)
                .frame(maxWidth: .infinity)
            
            Text(trailingString)
                .font(.theme.subheadline)
                .frame(maxWidth: .infinity)
        }
        .lineLimit(1)
        .minimumScaleFactor(0.75)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    struct DetailsViewContainer: View {
        
        @StateObject private var viewModel = DashboardViewModel(service: CreditScoreService())
        
        var body: some View {
            DetailsView(viewModel, isPresented: .constant(true))
                .task {
                    await viewModel.loadCreditScore()
                }
        }
    }
    
    return DetailsViewContainer()
}
