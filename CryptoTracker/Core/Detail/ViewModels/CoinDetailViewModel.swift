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
    
    init(coin: CoinModel) {
        coinDetailServices = CoinDetailDataServices(coin: coin)
    }
    
    func addSubscribers() {
        coinDetailServices.$coinDetails.sink { coinDetails in
            print("RECEIVED COIN DETAILS")
            print(coinDetails)
        }
        .store(in: &cancellables)
    }
    
}
