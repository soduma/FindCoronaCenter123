//
//  CenterRow.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(center.facilityName)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel:" + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .강원도, facilityName: "집앞", address: "신림로 350", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999")
        CenterRow(center: center0)
    }
}
