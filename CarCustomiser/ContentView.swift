//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Matteo Mountain on 15/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    let car = Car(make: "Mazda", model: "MX5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    
    var body: some View {
        Text("""
             Make: \(car.make)
             Model: \(car.model)
             Top Speed: \(car.topSpeed)mph
             Acceleration (0-60): \(String(format: "%.1f", car.acceleration))s
             Handling: \(car.handling)
             """)
            .offset(x: -60,y: -280)

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
