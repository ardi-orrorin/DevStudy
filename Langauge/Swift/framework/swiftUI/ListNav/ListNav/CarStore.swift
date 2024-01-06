import SwiftUI

class CarStore: ObservableObject {
    
    @Published var cars: [Car]
    
    init (cars: [Car] = []) {
        self.cars = cars
    }
}
