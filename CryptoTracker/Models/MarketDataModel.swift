//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import Foundation

// JSON Response:
/**
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 17046,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1268,
     "total_market_cap": {
       "btc": 33303888.653355435,
       "eth": 1363081313.2414184,
       "ltc": 33115800449.498173,
       "bch": 8306150182.857033,
       "bnb": 5229158689.285734,
       "eos": 3741364261053.56,
       "xrp": 1440306262339.4504,
       "xlm": 11062419290445.396,
       "link": 204059056358.92548,
       "dot": 673948799257.8547,
       "yfi": 531190455.27539027,
       "usd": 3468639511251.8203,
       "aed": 12740278238432.824,
       "ars": 3910493612221227,
       "aud": 5412118229406.216,
       "bdt": 422832095764260.94,
       "bhd": 1307635472067.8015,
       "bmd": 3468639511251.8203,
       "brl": 19612034660568.918,
       "cad": 4836150638562.849,
       "chf": 2884624676742.3516,
       "clp": 3238634025260712.5,
       "cny": 25062134492623.34,
       "czk": 76929568264249.62,
       "dkk": 23004364102573.2,
       "eur": 3083100229576.181,
       "gbp": 2607216763190.4766,
       "gel": 9521415458386.248,
       "hkd": 26981679598150.098,
       "huf": 1246108744417216.2,
       "idr": 57387939247224376,
       "ils": 12286961740707.322,
       "inr": 296266386278625.06,
       "jpy": 504255185439181.94,
       "krw": 4841831517387506,
       "kwd": 1064001701436.9845,
       "lkr": 1041752612776149.5,
       "mmk": 7277205694606319,
       "mxn": 67442353591444.305,
       "myr": 14920352857649.705,
       "ngn": 5574485244927913,
       "nok": 35972219779339.25,
       "nzd": 5868112516834.401,
       "php": 192075902529651.06,
       "pkr": 977806966926881.9,
       "pln": 13048501545402.66,
       "rub": 286163037169436.1,
       "sar": 13010859869426.557,
       "sek": 33686386341424.28,
       "sgd": 4503556670386.959,
       "thb": 114361030811414.48,
       "try": 134463198109481.31,
       "twd": 104945419264039.95,
       "uah": 144329816040666.88,
       "vef": 347314874261.6446,
       "vnd": 90063224909653520,
       "zar": 63128545376880.87,
       "xdr": 2498037865934.3135,
       "xag": 105954727457.6635,
       "xau": 1042187427.5507219,
       "bits": 33303888653355.434,
       "sats": 3330388865335543.5
     },
     "total_volume": {
       "btc": 1338797.2073508562,
       "eth": 54795086.38027731,
       "ltc": 1331236169.518886,
       "bch": 333902469.60021025,
       "bnb": 210209177.75933236,
       "eos": 150400695742.06152,
       "xrp": 57899485006.707405,
       "xlm": 444702905620.0128,
       "link": 8203056935.22836,
       "dot": 27092354881.896713,
       "yfi": 21353551.39744235,
       "usd": 139437317344.709,
       "aed": 512151872233.9428,
       "ars": 157199598578338.03,
       "aud": 217564046252.94952,
       "bdt": 16997607543059.93,
       "bhd": 52566195391.14717,
       "bmd": 139437317344.709,
       "brl": 788392535998.7194,
       "cad": 194410479707.86047,
       "chf": 115960256223.38036,
       "clp": 130191228831581.39,
       "cny": 1007483420876.5934,
       "czk": 3092524486461.364,
       "dkk": 924762232361.8447,
       "eur": 123938859521.84464,
       "gbp": 104808617331.41994,
       "gel": 382755436111.2263,
       "hkd": 1084648032295.1554,
       "huf": 50092856256086.7,
       "idr": 2306962216920087,
       "ils": 493928809230.1627,
       "inr": 11909738670766.031,
       "jpy": 20270769010937.938,
       "krw": 194638847775773.28,
       "kwd": 42772257658.17214,
       "lkr": 41877857065038.21,
       "mmk": 292539491789199.56,
       "mxn": 2711143902299.1553,
       "myr": 599789620558.2659,
       "ngn": 224091107077855.3,
       "nok": 1446062586986.7737,
       "nzd": 235894754865.7196,
       "php": 7721341029651.312,
       "pkr": 39307278806855.71,
       "pln": 524542272253.1936,
       "rub": 11503589835923.883,
       "sar": 523029098485.36884,
       "sek": 1354173394856.6096,
       "sgd": 181040393096.9458,
       "thb": 4597247795105.787,
       "try": 5405343381794.583,
       "twd": 4218745615485.527,
       "uah": 5801975759165.272,
       "vef": 13961858585.725706,
       "vnd": 3620489944855370,
       "zar": 2537731288210.2344,
       "xdr": 100419688330.67786,
       "xag": 4259319225.523807,
       "xau": 41895336.36939127,
       "bits": 1338797207350.8562,
       "sats": 133879720735085.61
     },
     "market_cap_percentage": {
       "btc": 59.641945139636874,
       "eth": 8.87750633550311,
       "usdt": 4.321050348185263,
       "xrp": 4.065607020729917,
       "bnb": 2.7912823065406953,
       "sol": 2.6403455362202894,
       "usdc": 1.753549949480813,
       "doge": 1.032723882281951,
       "ada": 0.8527309198918882,
       "trx": 0.7282517247215039
     },
     "market_cap_change_percentage_24h_usd": 0.43025764757607526,
     "updated_at": 1746935619
   }
 }
 
 **/

// MARK: - Global Data
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - MarketDataModel
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
