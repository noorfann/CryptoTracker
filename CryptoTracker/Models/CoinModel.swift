//
//  CoinModel.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 06/05/25.
//

import Foundation

// Coin Gecko API Info
/**
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 94412,
 "market_cap": 1874739711976,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 1874741788640,
 "total_volume": 20132668997,
 "high_24h": 95111,
 "low_24h": 93704,
 "price_change_24h": -293.71287613864115,
 "price_change_percentage_24h": -0.31013,
 "market_cap_change_24h": -6060517246.5703125,
 "market_cap_change_percentage_24h": -0.32223,
 "circulating_supply": 19860831,
 "total_supply": 19860853,
 "max_supply": 21000000,
 "ath": 108786,
 "ath_change_percentage": -13.1764,
 "ath_date": "2025-01-20T09:11:54.494Z",
 "atl": 67.81,
 "atl_change_percentage": 139190.52492,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2025-05-06T07:50:56.758Z",
 "sparkline_in_7d": {
 "price": [
 94309.34150552544,
 94736.90399716885,
 94945.88818709119,
 95036.50761795617,
 94982.69960125435,
 94844.8964248396,
 95138.9826524075,
 94821.9984027527,
 94844.97712552836,
 95008.0858721801,
 94884.37969661214,
 95126.89727545314,
 95246.67705322705,
 95432.6412390394,
 95352.38806277467,
 94869.96433327574,
 94734.09131013733,
 94172.7308096848,
 94274.73761715383,
 94516.29757229747,
 94518.40205174654,
 94648.3447693538,
 95025.12104407264,
 95035.54414534067,
 94946.4723594617,
 94835.45943330207,
 94613.33654937492,
 94750.99713603835,
 94918.12565036309,
 94977.78012458209,
 95184.3208761479,
 94554.20540577683,
 93438.4113920031,
 93852.9834130323,
 93960.92369309088,
 93852.7884446117,
 94160.41262165838,
 94112.51913791492,
 94243.79947751077,
 94635.11580314163,
 94558.76592370817,
 94239.62198019015,
 94286.27798563991,
 94504.1218590692,
 94747.50335326188,
 94863.80495374925,
 94810.38565218869,
 94868.17338025161,
 95122.89587391756,
 94975.44965385088,
 95012.07609052637,
 95191.59290594971,
 95605.38961340772,
 96109.699924197,
 96193.46052079443,
 96401.97464348341,
 95925.84792324655,
 96749.27550848683,
 97029.26431397643,
 97176.44540379278,
 96792.53145567431,
 96867.06052048807,
 96463.63976230014,
 96468.24929711736,
 96533.24903530022,
 96346.4385297464,
 96465.09077322687,
 97068.51079800248,
 96864.53630852731,
 97058.54156171245,
 97183.42883942672,
 96951.50818834538,
 96715.25683617221,
 96702.21533716211,
 96471.938225181,
 96638.93322232095,
 96682.78962027833,
 96876.45142344802,
 96955.62770097495,
 97103.35603243245,
 96929.04808700876,
 97715.58382024213,
 97576.91324468188,
 97252.90131454506,
 97426.94700917671,
 97171.61991369829,
 96984.40777110745,
 97041.44181128644,
 96738.11613131239,
 96685.63911259717,
 96932.91347341705,
 96730.10192500369,
 96523.60435697486,
 96585.86635562367,
 96399.3103307854,
 96537.85554466437,
 96380.04392946887,
 96226.48114418039,
 96219.45399678136,
 96358.32950974852,
 96278.3950554348,
 95964.52767965854,
 95976.4505745279,
 96173.42460959752,
 96321.3677258507,
 96480.99719442788,
 96425.31179505517,
 96208.48935554299,
 96183.72181610571,
 96178.88564981271,
 96392.32633421359,
 96358.9081323945,
 96279.18995625683,
 96206.39898420339,
 95911.57974109074,
 95895.53297681686,
 95915.88640420574,
 95922.38712221736,
 95806.54957964174,
 95780.01377709549,
 96064.91190994653,
 95913.60802998614,
 95922.80323598157,
 95625.17286104144,
 95523.33996950623,
 95446.2718625732,
 95458.83076597172,
 95563.77480239843,
 95378.85274818254,
 95608.48318552892,
 95525.92857480767,
 95450.75277975168,
 95430.42950592804,
 95398.8923422279,
 95578.93519558122,
 95732.77578576689,
 95492.48013580107,
 94990.11188430124,
 94303.45616731183,
 94665.39195249154,
 93904.08029713292,
 94283.45228200975,
 94081.95126956061,
 94388.68665108354,
 94662.83806875185,
 94728.12709624284,
 94736.51570501548,
 94552.9528661461,
 94588.80144204857,
 94133.1803452243,
 94088.5057159754,
 94280.48803833337,
 94365.43018781069,
 93831.61281503776,
 93724.80501461533,
 94207.40183338308,
 94488.70233451825,
 94732.07505209661,
 94381.49765604567,
 94236.88089735083,
 94712.89911153041,
 95036.71686518363,
 94719.67050036856,
 94553.5512061966,
 94311.76641275226,
 94288.01718818802,
 94409.2116200293,
 94559.93816867477
 ]
 }
 }
 
 **/

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, currentHoldings: amount)
    }
    
    var currentHoldingValue:Double  {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
