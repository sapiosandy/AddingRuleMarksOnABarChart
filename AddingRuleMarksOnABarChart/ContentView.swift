//
//  ContentView.swift
//  AddingRuleMarksOnABarChart
//
//  Created by Sandra Gomez on 4/10/24.
//

import SwiftUI
import Charts

struct SalesPeople: Identifiable {
    var name: String
    var sales: Int
    var id = UUID()
}

var mySalesArray: [SalesPeople] = [
    .init(name: "Oscar", sales: 50),
    .init(name: "Meyer", sales: 43),
    .init(name: "George", sales: 62),
    .init(name: "Hormel", sales: 26)
]

struct ContentView: View {
    var body: some View {
        Chart (mySalesArray) { z in
            BarMark(x: .value("Name", z.name),
                    y: .value("Sales", z.sales))
            
            RuleMark(y: .value("Average Sales", (mySalesArray.map{Int($0.sales)}).reduce(0, +) / Set(mySalesArray.map({$0.sales})).count))
                .foregroundStyle(.green)
            
            RuleMark(y: .value("Sales must not go below this line", 20))
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ContentView()
}
