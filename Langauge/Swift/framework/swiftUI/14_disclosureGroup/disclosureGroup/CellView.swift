//
//  CellView.swift
//  disclosureGroup
//
//  Created by 유승철 on 1/8/24.
//

import SwiftUI

struct CellView: View {
    var item: CarInfo
    var body: some View {
        HStack {
            Text(item.name)
        }
    }
}

//#Preview {
//    CellView()
//}
