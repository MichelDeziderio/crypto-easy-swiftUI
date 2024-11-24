//
//  ContentView.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 23/11/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @StateObject private var cryptoService = CryptoService()
    
    let gradient = LinearGradient(colors: [Color("backgroundColor1"), Color("backgroundColor2")],
                                      startPoint: .top, endPoint: .bottom)
    
    @State private var selectedSymbol: String = "BTC"
    let symbols = ["BTC", "ETH", "LTC", "SOL", "ADA"]
    
    var body: some View {
        NavigationView {
            
            ZStack {
                gradient
                    .opacity(1)
                    .ignoresSafeArea()
                
                // MARK: ContentView Component
                content
            }
            .background(.clear)
            .statusBar(hidden: true)
        }
        .navigationViewStyle(.automatic)
        .background(Color("backgroundColor1"))
    }
    
    // MARK: ContentView Component Body
    var content: some View {

        ScrollView {
            
            VStack (alignment: .leading) {
               
                Text("Overview")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color(.white).opacity(0.8))
                    .padding([.top], 50)
                    .padding([.bottom], 20)
                
                // MARK: ChartView Component
                let filteredData = cryptoService.cryptos
                    .filter { $0.symbol == selectedSymbol }
                    .map { ($0.symbol, $0.price) }

                CryptoChartView(
                    data: filteredData,
                    title: selectedSymbol
                )

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            // MARK: Button change view values Chart
            Picker("Select Crypto", selection: $selectedSymbol) {
                ForEach(symbols, id: \.self) { symbol in
                    Text(symbol).tag(symbol)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // MARK: List last updates values Cryptos
            cryptoList(selectedSymbol: selectedSymbol)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        
    }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
