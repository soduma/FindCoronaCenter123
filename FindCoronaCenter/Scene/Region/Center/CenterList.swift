//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .강원도, facilityName: "집앞", address: "ㅎㅇㅎㅇ", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999"),
            Center(id: 1, sido: .강원도, facilityName: "집앞", address: "ㅎㅇㅎㅇ", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999"),
            Center(id: 2, sido: .강원도, facilityName: "집앞", address: "ㅎㅇㅎㅇ", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999")
        ]
        CenterList(centers: centers)
    }
}
