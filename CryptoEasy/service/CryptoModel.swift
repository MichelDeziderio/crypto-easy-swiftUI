//
//  cryptoModel.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import Foundation

struct Crypto: Identifiable, Decodable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let change_24h: Double
    let volume_24h: Int
    let market_cap: Int
}
