//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity) //여기가 문제였음. 둘다 맥스
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .강원도, facilityName: "집앞", address: "신림로 350", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999")
        
        CenterDetailView(center: center0)
    }
}
