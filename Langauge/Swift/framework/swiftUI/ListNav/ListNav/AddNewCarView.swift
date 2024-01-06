//
//  AddNewCarView.swift
//  ListNav
//
//  Created by 유승철 on 1/7/24.
//

import SwiftUI

struct AddNewCarView: View {
    
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath
    
    @State private var isHybird: Bool = false
    @State private var name: String = ""
    @State private var description: String  = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInputView(title: "Model", userInput: $name)
                DataInputView(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybird) {
                    Text("Hybrid")
                        .font(.headline)
                }.padding()
                

            }
        }
        
        Button(action: addNewCar) {
            Text("Add Car")
        }
    }
    
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybird, imageName: "tesla_model_3")
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

//#Preview {
//    AddNewCarView(carStore: CarStore(cars: carData))
//}
