//
//  CarDetail.swift
//  ListNav
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct CarDetail: View {
    
    let selectedCar : Car
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle"
                    )
                    
                }
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
