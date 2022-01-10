//
//  RegionView.swift
//  FindCoronaCenter
//
//  Created by 장기화 on 2022/01/10.
//

import SwiftUI

struct RegionView: View {
    @ObservedObject var viewModel = RegionViewModel() //bind()
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(Center.Sido.allCases, id: \.id) { sido in  //CaseIterable로 allCases 사용가능
                        let centers = viewModel.centers[sido] ?? []
                        NavigationLink(destination: CenterList(centers: centers)) {
                            RegionItem(region: sido, count: centers.count)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("코로나19 예방접종 센터")
        }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegionViewModel()
        RegionView(viewModel: viewModel)
    }
}
