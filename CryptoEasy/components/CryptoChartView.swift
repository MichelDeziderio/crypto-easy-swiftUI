//
//  CryptoChartView.swift
//  CryptoEasy
//
//  Created by Michel Deziderio on 24/11/24.
//

import SwiftUI
import SwiftUICharts

struct CryptoChartView: View {
    
    let data: [(String, Double)] 
    let title: String
    
    var body: some View {
        if !data.isEmpty {

            CardView {
                VStack(alignment: .leading) {
                    ChartLabel(" ",
                       type: .title,
                       format: "$%.02f"
                    )
                    
                    LineChart()
                }
                .background(Color("backgroundColor1"))
            }
            .data(data)
            .chartStyle(ChartStyle(
                backgroundColor: Color("backgroundCard"),
                foregroundColor: ColorGradient(Color("valueCardUp").opacity(0.3), Color("valueCardUp").opacity(0.5))
            ))
            .frame(height: 300)
        }
    }
}

struct CryptoChartView_Previews: PreviewProvider {
    static var data: [(String, Double)] = [
        ("BTC", 50000.0),
        ("ETH", 3000.0),
        ("ADA", 1.2),
        ("SOL", 200.0),
        ("LTC", 150.0)
    ]
    
    static var title = " "
    
    static var previews: some View {
        CryptoChartView(data: data, title: title)
    }
}
