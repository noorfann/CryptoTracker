//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 08/05/25.
//

import Foundation
import SwiftUI
import Combine


class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(folderName: folderName, imageName: imageName) {
            image = savedImage
//            print("Retrieved image from cache")
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
//        print("download image now")
        guard let url = URL(string: coin.image) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("CG-gXhBhz3XVzNAc1qsGbyv8ah6", forHTTPHeaderField: "x-cg-demo-api-key")

        imageSubscription = NetworkingManager.download(request: request)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage  else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
