//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable { //핀
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
            MapMarker(coordinate: $0.coordinate, tint: .mint)
        })
        .onAppear {
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        region = MKCoordinateRegion(center: coordinate, span: span) //1에 가까울수록 넓은 범위
    }
    
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .강원도, facilityName: "집앞", address: "신림로 350", lat: "37.404476", lng: "126.949198", centerType: .central, phoneNumber: "02-9999-9999")
        
        MapView(coordination: CLLocationCoordinate2D(
            latitude: CLLocationDegrees(center0.lat) ?? .zero,
            longitude: CLLocationDegrees(center0.lng) ?? .zero))
    }
}
