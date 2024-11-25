//
//  CryptoViewModal.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 24/11/24.
//

import SwiftUI

struct CryptoViewModal: View {
    
    @StateObject private var cryptoService = CryptoService()
    
    let gradient = LinearGradient(colors: [Color("backgroundColor1"), Color("backgroundColor2")],
          startPoint: .top, endPoint: .bottom)
    
    var cryptoList: [Crypto]

    var body: some View {
        
        ScrollView {
            ZStack {
                VStack() {
                    
                    if !cryptoList.isEmpty {

                        ForEach(cryptoList) { crypto in
                            CryptoView(crypto: crypto)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
                                
                            Spacer()
                              .padding(.bottom, 5)

                        }
                        
                    }
                    
                }
                
            }
            .ignoresSafeArea()
            .padding()
            
        }
        .background(Color("backgroundColor1"))
    }
}

struct CryptoViewModal_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CryptoViewModal(cryptoList: previewListData)
            CryptoViewModal(cryptoList: previewListData)
                .preferredColorScheme(.dark)
        }
    }
}
