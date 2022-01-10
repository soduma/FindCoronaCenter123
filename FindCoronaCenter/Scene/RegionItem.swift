//
//  RegionItem.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI

struct RegionItem: View {
    var region: Center.Sido
    var count: Int
    
    var body: some View {
        ZStack {
            Color(white: 0.9)
            VStack {
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.teal)
                Text("(\(count))")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct RegionItem_Previews: PreviewProvider {
    static var previews: some View {
        let region0 = Center.Sido.경상남도
        RegionItem(region: region0, count: 3)
    }
}
