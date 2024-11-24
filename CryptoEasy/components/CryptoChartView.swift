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
                .background(Color("backgroundCard"))
            }
            .data(data)
            .chartStyle(ChartStyle(
                backgroundColor: Color("backgroundCard"),
                foregroundColor: ColorGradient(Color("valueCardDown").opacity(0.4), Color("valueCardDown"))
            ))
            .frame(height: 300)
        }
    }
}

//struct CryptoChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoChartView(data: data, title: title)
//    }
//}
