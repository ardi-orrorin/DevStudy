//
//  ContentView.swift
//  ListNav
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI
import 

struct ContentView: View {
    
    @StateObject var carStore: CarStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(0..<carStore.cars.count, id: \.self) {i in
                    NavigationLink(value: i) {
                        ListCell(car: carStore.cars[i])
                    }
                }
                .onMove(perform: moveItems)
                .onDelete(perform: deleteItems)
                .padding(10)
                
            }
            .navigationDestination(for: Int.self) { i in
                CarDetail(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { i in
                switch i {
                case "Add Car": AddNewCarView(carStore: self.carStore, path: $stackPath)
                    default: EmptyView()
                }
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(value: "Add Car") {
                Text("Add")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }, trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}



struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 60)
            Text(car.name)
        }
    }
}

#Preview {
    ContentView()
}
