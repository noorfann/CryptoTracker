//
//  HomeStatsView.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
            }
            .frame(width: UIScreen.width / 3)
        }
        .frame(width: UIScreen.width, alignment: showPortfolio ? .trailing : .leading)
        
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false)).environmentObject(dev.homeVM)
}
