//
//  cryptoService.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import Foundation
import Combine

final class CryptoService: ObservableObject {
    @Published var cryptos: [Crypto] = []
    
    init() {
        fetchCryptosPRD()
    }
  
    func fetchCryptosPRD() {
        guard let url = URL(string: "https://webmaissimples.com.br/crypto.json") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                }
            }
        }.resume()
        
    }

    func fetchCryptos() {
        guard let url = URL(string: "https://webmaissimples.com.br/crypto.json") else {
            print("Invalid url")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server Error: Invalid response")
                    return
                }

                if let data = data {
                    DispatchQueue.main.async {
                        do {
                            self.cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                        } catch {
                            print("Error decoding data: \(error)")
                        }
                    }
                }
            }.resume()
    }
    
    func filteredCryptos(for symbol: String) -> [Crypto] {
        return cryptos.filter { symbol == $0.symbol }
    }
}

