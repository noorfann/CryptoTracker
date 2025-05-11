//
//  MarketDataServices.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import Foundation
import Combine

class MarketDataServices {
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("CG-gXhBhz3XVzNAc1qsGbyv8ah6", forHTTPHeaderField: "x-cg-demo-api-key")

        marketSubscription = NetworkingManager.download(request: request)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketSubscription?.cancel()
            })
    }
    
}
