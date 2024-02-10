//
//  ContentView.swift
//  RestApiCall
//
//  Created by 유승철 on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var resData = [JSONdata]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(resData, id: \.id) {data in
                    NavigationLink(destination: JsonItem(jsonData: data) , label: {
                        HStack {
                            ZStack {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(width: 40, height: 30)
                                
                                Text("\(data.id)")
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 30)
                            }
                            .frame(maxWidth: 40)

                            VStack(alignment: .leading, spacing: 10) {
                                Text(data.name)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                Text(data.email)
                                    .font(.caption)
                            }
                            .padding(.horizontal, 5)
                            
                        }
                    })
                    
                }
            }
            .navigationBarTitle(Text("Rest API Call"))
            .navigationBarTitleDisplayMode(.large)
        }
        
        .task {
            resData = await getData() ?? []
        }
    }
}

#Preview {
    ContentView()
}
