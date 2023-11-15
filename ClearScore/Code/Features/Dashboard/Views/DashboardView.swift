//
//  DashboardView.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import SwiftUI

struct DashboardView<ServiceType: ICreditScoreFetcher>: View {
    
    @State private var isPresentingDetailPage: Bool = false
    
    @StateObject private var viewModel: DashboardViewModel<ServiceType>
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            centerView
                .onTapGesture {
                    isPresentingDetailPage = true
                }
            
            Image("clearscore.logo")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
        }
        .sheet(isPresented: $isPresentingDetailPage, content: {
            DetailsView(viewModel, isPresented: $isPresentingDetailPage)
        })
    }
}

extension DashboardView {
    
    private var centerView: some View {
        VStack(spacing: 0) {
            DonutScoreView(viewModel)
                .padding(20)
            
            Text("Tap for more details")
                .foregroundColor(.theme.textSeconary)
                .font(.theme.subheadline)
        }
        .contentShape(Circle())
    }
}

extension DashboardView where ServiceType == CreditScoreService {
    init(){
        self.init(viewModel: .init(service: .init()))
    }
}

#Preview {
    DashboardView()
}
