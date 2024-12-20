//
//  CryptoView.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import SwiftUI

struct CryptoView: View {
    @StateObject private var cryptoService = CryptoService()
    var crypto: Crypto

    var body: some View {
        
        HStack {
            
            HStack(spacing: 20) {
                VStack (alignment: .leading) {
                    Text("\(crypto.name)")
                        .font(.headline)
                        .foregroundStyle(Color(.white).opacity(0.6))
//                            .textCase(.uppercase)
                        
                    Text("(\(crypto.symbol))")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color(.white).opacity(0.6))
                }
            
                Spacer()
            
                VStack(alignment: .trailing) {
                    Text("Price: $\(crypto.price, specifier: "%.2f")")
                        .foregroundColor(crypto.change_24h >= 0 ? Color("valueCardUp") : Color("valueCardDown"))
                    Text("24h Change: \(crypto.change_24h, specifier: "%.2f")%")
                        .foregroundStyle(Color(.white))
                        .opacity(0.5)
                }
                .padding(.vertical, 20)
                        
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("backgroundCard").opacity(1))
            .cornerRadius(10)
//            .shadow(color: Color.primary.opacity(0.4), radius: 10, x: 0, y: 5)
        }
    }
    
}


struct CryptoView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            CryptoView(
                crypto: previewData
            )
            CryptoView(
                crypto: previewData
            )
            .preferredColorScheme(.dark)
        }
    }

}
