//
//  DetailView.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 12/05/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm: CoinDetailViewModel
    @State var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        self._vm = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
        print("Initialize detail view for \(coin.name)")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical, 4)
                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    descriptionSection
                    overviewGrid
    
                    additionalTitle
                    Divider()
                    additionalGrid
                    
                    websiteSection
                    
                }.padding()
            }
        }
        .navigationTitle(vm.coin.name.uppercased())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                navigationBarTrailingItem
            }
        }
    }
}

#Preview {
    NavigationView {
        DetailView(coin: dev.coin)
    }
}

extension DetailView {
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
            ForEach(vm.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var additionalTitle: some View {
        Text("Additional")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
            ForEach(vm.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let description = vm.coinDescription, !description.isEmpty {
                VStack(alignment: .leading) {
                    Text(description)
                        .font(.callout)
                        .lineLimit(showFullDescription ? nil : 3)
                        .foregroundStyle(Color.theme.secondaryText)
                    Button {
                        showFullDescription.toggle()
                    } label: {
                        Text(showFullDescription ? "Less" : "Read more..")
                            .font(.caption)
                            .padding(.vertical, 4)
                            .bold()
                    }.tint(.blue)
                }.frame(maxWidth: .infinity, alignment: .leading)

            }
        }
    }
    
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let websiteURL = vm.websiteURL, let url = URL(string: websiteURL) {
                
                Link(destination: url) {
                    Text("Website")
                }
            }
            
            if let redditUrl = vm.redditURL, let url = URL(string: redditUrl) {
                
                Link(destination: url) {
                    Text("Reddit")
                }
            }
        }
        .tint(.blue)
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
