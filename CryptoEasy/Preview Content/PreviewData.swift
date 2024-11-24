//
//  PreviewData.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import Foundation

var previewData = Crypto (
    id: "9afc0eff-193f-408c-87ad-6d278f49a91d",
    name: "Bitcoin",
    symbol: "HTC",
    price: 2565.2,
    change_24h: 0.65,
    volume_24h: 29987943,
    market_cap: 256938585
)

var previewListData = [Crypto](repeating: previewData, count: 10)
