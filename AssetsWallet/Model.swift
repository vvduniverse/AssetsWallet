//
//  Model.swift
//  AssetsWallet
//
//  Created by Vahtee Boo on 06.10.2021.
//


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Status?
    let data: [Datum]?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.datumTask(with: url) { datum, response, error in
//     if let datum = datum {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Datum
struct Datum: Codable {
    let lastUpdated: LastUpdated?
    let platform: PlatformUnion?
    let name: String?
    let tags: [String]?
    let quote: Quote?
    let symbol, slug: String?
    let totalSupply: Double?
    let numMarketPairs: Int?
    let maxSupply: MaxSupply?
    let circulatingSupply: Double?
    let cmcRank: Int?
    let dateAdded: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case platform, name, tags, quote, symbol, slug
        case totalSupply = "total_supply"
        case numMarketPairs = "num_market_pairs"
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case cmcRank = "cmc_rank"
        case dateAdded = "date_added"
        case id
    }
}

enum LastUpdated: String, Codable {
    case the20211006T082707000Z = "2021-10-06T08:27:07.000Z"
    case the20211006T082708000Z = "2021-10-06T08:27:08.000Z"
    case the20211006T082709000Z = "2021-10-06T08:27:09.000Z"
    case the20211006T082710000Z = "2021-10-06T08:27:10.000Z"
    case the20211006T082711000Z = "2021-10-06T08:27:11.000Z"
    case the20211006T082712000Z = "2021-10-06T08:27:12.000Z"
    case the20211006T082713000Z = "2021-10-06T08:27:13.000Z"
    case the20211006T082714000Z = "2021-10-06T08:27:14.000Z"
    case the20211006T082715000Z = "2021-10-06T08:27:15.000Z"
    case the20211006T082716000Z = "2021-10-06T08:27:16.000Z"
    case the20211006T082717000Z = "2021-10-06T08:27:17.000Z"
    case the20211006T082718000Z = "2021-10-06T08:27:18.000Z"
    case the20211006T082719000Z = "2021-10-06T08:27:19.000Z"
    case the20211006T082720000Z = "2021-10-06T08:27:20.000Z"
    case the20211006T082802000Z = "2021-10-06T08:28:02.000Z"
    case the20211006T082803000Z = "2021-10-06T08:28:03.000Z"
    case the20211006T082804000Z = "2021-10-06T08:28:04.000Z"
    case the20211006T082805000Z = "2021-10-06T08:28:05.000Z"
    case the20211006T082806000Z = "2021-10-06T08:28:06.000Z"
    case the20211006T082807000Z = "2021-10-06T08:28:07.000Z"
}

enum MaxSupply: Codable {
    case bool(Bool)
    case double(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(MaxSupply.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MaxSupply"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .double(let x):
            try container.encode(x)
        }
    }
}

enum PlatformUnion: Codable {
    case bool(Bool)
    case platformClass(PlatformClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(PlatformClass.self) {
            self = .platformClass(x)
            return
        }
        throw DecodingError.typeMismatch(PlatformUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PlatformUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .platformClass(let x):
            try container.encode(x)
        }
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.platformClassTask(with: url) { platformClass, response, error in
//     if let platformClass = platformClass {
//       ...
//     }
//   }
//   task.resume()

// MARK: - PlatformClass
struct PlatformClass: Codable {
    let symbol: Symbol?
    let tokenAddress: String?
    let id: Int?
    let slug: Slug?
    let name: Name?

    enum CodingKeys: String, CodingKey {
        case symbol
        case tokenAddress = "token_address"
        case id, slug, name
    }
}

enum Name: String, Codable {
    case algorand = "Algorand"
    case arbitrumEthereum = "Arbitrum (Ethereum)"
    case avalanche = "Avalanche"
    case avalancheCChain = "Avalanche C-Chain"
    case binanceChainBEP2 = "Binance Chain (BEP2)"
    case binanceSmartChainBEP20 = "Binance Smart Chain (BEP20)"
    case cardano = "Cardano"
    case celo = "Celo"
    case chiliz = "Chiliz"
    case cosmos = "Cosmos"
    case eos = "EOS"
    case ethereum = "Ethereum"
    case fantom = "Fantom"
    case heco = "Heco"
    case iost = "IOST"
    case kcc = "KCC"
    case klaytn = "Klaytn"
    case kusama = "Kusama"
    case moonriver = "Moonriver"
    case neo = "Neo"
    case okExChain = "OKExChain"
    case ont = "ONT"
    case polygon = "Polygon"
    case solana = "Solana"
    case stellar = "Stellar"
    case terra = "Terra"
    case tezos = "Tezos"
    case tomoChain = "TomoChain"
    case tron10 = "Tron10"
    case tron20 = "Tron20"
    case veChain = "VeChain"
    case wanchain = "Wanchain"
    case waves = "Waves"
    case xdaiChain = "Xdai chain"
}

enum Slug: String, Codable {
    case algorand = "algorand"
    case arbitrumEthereum = "arbitrum-ethereum"
    case avalanche = "avalanche"
    case binanceCoin = "binance-coin"
    case cardano = "cardano"
    case celo = "celo"
    case chiliz = "chiliz"
    case cosmos = "cosmos"
    case eos = "eos"
    case ethereum = "ethereum"
    case fantom = "fantom"
    case huobiToken = "huobi-token"
    case iostoken = "iostoken"
    case klaytn = "klaytn"
    case kucoinToken = "kucoin-token"
    case kusama = "kusama"
    case moonriver = "moonriver"
    case neo = "neo"
    case okexchain = "okexchain"
    case ontology = "ontology"
    case polygon = "polygon"
    case solana = "solana"
    case stellar = "stellar"
    case terraLuna = "terra-luna"
    case tezos = "tezos"
    case tomochain = "tomochain"
    case tron = "tron"
    case vechain = "vechain"
    case wanchain = "wanchain"
    case waves = "waves"
    case xdai = "xdai"
}

enum Symbol: String, Codable {
    case ada = "ADA"
    case algo = "ALGO"
    case arbitrum = "ARBITRUM"
    case atom = "ATOM"
    case avax = "AVAX"
    case bnb = "BNB"
    case celo = "CELO"
    case chz = "CHZ"
    case eos = "EOS"
    case eth = "ETH"
    case ftm = "FTM"
    case ht = "HT"
    case iost = "IOST"
    case kcs = "KCS"
    case klay = "KLAY"
    case ksm = "KSM"
    case luna = "LUNA"
    case matic = "MATIC"
    case movr = "MOVR"
    case neo = "NEO"
    case okt = "OKT"
    case ont = "ONT"
    case sol = "SOL"
    case stake = "STAKE"
    case tomo = "TOMO"
    case trx = "TRX"
    case vet = "VET"
    case wan = "WAN"
    case waves = "WAVES"
    case xlm = "XLM"
    case xtz = "XTZ"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.quoteTask(with: url) { quote, response, error in
//     if let quote = quote {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.usdTask(with: url) { usd, response, error in
//     if let usd = usd {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Usd
struct Usd: Codable {
    let percentChange60D, marketCapDominance, percentChange7D, price: Double?
    let percentChange90D, percentChange24H, marketCap, volume24H: Double?
    let percentChange30D: Double?
    let lastUpdated: LastUpdated?
    let percentChange1H, fullyDilutedMarketCap: Double?

    enum CodingKeys: String, CodingKey {
        case percentChange60D = "percent_change_60d"
        case marketCapDominance = "market_cap_dominance"
        case percentChange7D = "percent_change_7d"
        case price
        case percentChange90D = "percent_change_90d"
        case percentChange24H = "percent_change_24h"
        case marketCap = "market_cap"
        case volume24H = "volume_24h"
        case percentChange30D = "percent_change_30d"
        case lastUpdated = "last_updated"
        case percentChange1H = "percent_change_1h"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.statusTask(with: url) { status, response, error in
//     if let status = status {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Status
struct Status: Codable {
    let notice: Bool?
    let creditCount: Int?
    let timestamp: String?
    let errorMessage: Bool?
    let elapsed, totalCount, errorCode: Int?

    enum CodingKeys: String, CodingKey {
        case notice
        case creditCount = "credit_count"
        case timestamp
        case errorMessage = "error_message"
        case elapsed
        case totalCount = "total_count"
        case errorCode = "error_code"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

