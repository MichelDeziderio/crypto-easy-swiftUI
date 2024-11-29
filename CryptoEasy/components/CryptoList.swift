//
//  cryptoList.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import SwiftUI

struct cryptoList: View {
    @StateObject private var cryptoService = CryptoService()
    var selectedSymbol: String = "BTC"
    @State private var showModal: Bool =  false
    
    var body: some View {
        
            VStack {
                HStack {
                    Text("Recent Updates (\(selectedSymbol))")
                        .bold()
                        .foregroundStyle(Color(.white).opacity(0.6))
                    
                    Spacer()
                    
                    Button(action: {
                        showModal = true
                    }){
                        Text("See All")
                            .foregroundColor( Color("valueCardDown").opacity(1) )
                    }
                }
                .padding([.top, .bottom], 8)
                
                Spacer()
                
                let cryptoList = cryptoService.filteredCryptos(for: selectedSymbol)
                
                ForEach(Array(cryptoList.prefix(5).enumerated()),
                        id: \.element){ index,crypto in
                    CryptoView(crypto: crypto)
                        
                    
                    Spacer()
                      .padding(.bottom, 10)

                }.onAppear() {
                    cryptoService.fetchCryptosPRD()
                }
                
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
            .sheet(isPresented: $showModal) {
                if let cryptoList = cryptoService.filteredCryptos(for: selectedSymbol) {
                    CryptoViewModal(cryptoList: cryptoList)
                }
            }
        
    }
}

struct cryptoList_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            cryptoList(selectedSymbol: previewData.symbol)
            cryptoList(selectedSymbol: previewData.symbol)
                .preferredColorScheme(.dark)
        }
    }
}
