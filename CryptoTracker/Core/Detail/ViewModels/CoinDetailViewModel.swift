//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 12/05/25.
//

import Foundation
import Combine


class CoinDetailViewModel: ObservableObject {
    
    private let coinDetailServices: CoinDetailDataServices
    private var cancellables = Set<AnyCancellable>()
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    @Published var coin: CoinModel
    // information details
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil
    
    init(coin: CoinModel) {
        self.coin = coin
        coinDetailServices = CoinDetailDataServices(coin: coin)
        addSubscribers()
    }
    
    func addSubscribers() {
        coinDetailServices.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailServices.$coinDetails
            .sink { [weak self] (coinDetails) in
                guard let self = self else { return }
                self.coinDescription = coinDetails?.readableDescription
                self.websiteURL = coinDetails?.links?.homepage?.first
                self.redditURL = coinDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
            let overviewArray = createOverviewArray(coinModel: coinModel)
            let additionalArray = createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
            return (overviewArray, additionalArray)
        }
        
        private func createOverviewArray(coinModel: CoinModel) -> [StatisticModel] {
            let price = coinModel.currentPrice.asCurrencyWith6Decimals()
            let pricePercentChange = coinModel.priceChangePercentage24H
            let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
            
            let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
            let marketCapPercentChange = coinModel.marketCapChangePercentage24H
            let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
            
            let rank = "\(coinModel.rank)"
            let rankStat = StatisticModel(title: "Rank", value: rank)
            
            let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
            let volumeStat = StatisticModel(title: "Volume", value: volume)
            
            let overviewArray: [StatisticModel] = [
                priceStat, marketCapStat, rankStat, volumeStat
            ]
            return overviewArray
        }
        
        private func createAdditionalArray(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel] {
            
            let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
            let highStat = StatisticModel(title: "24h High", value: high)
            
            let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
            let lowStat = StatisticModel(title: "24h Low", value: low)
            
            let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
            let pricePercentChange = coinModel.priceChangePercentage24H
            let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
            
            let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
            let marketCapPercentChange = coinModel.marketCapChangePercentage24H
            let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
            
            let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
            let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
            let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
            
            let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
            let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
            
            let additionalArray: [StatisticModel] = [
                highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
            ]
            return additionalArray
        }
}
