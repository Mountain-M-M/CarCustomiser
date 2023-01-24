//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Matteo Mountain on 15/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar:Int = 0
    
    @State private var exhaustPackage = false
    @State private var tirePackage = false
    @State private var enginePackage = false
    @State private var remainingFunds = 1000
    
var exhaustPackageEnabled: Bool {
    if remainingFunds < 500 {
        return false
    }
    else {
        return true
    }
}
    
var tirePackageEnabled: Bool {
    if remainingFunds < 500 {
        return false
    }
    else {
        return true
    }
}
    
var enginePackageEnabled: Bool {
    if remainingFunds < 750 {
        return false
    }
    else {
        return true
    }
}

    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        let tirePackageBinding = Binding<Bool> (
            get : { self.tirePackage },
            set : { newValue in
                self.tirePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                }
                else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let enginePackageBinding = Binding<Bool> (
            get : { self.enginePackage },
            set : { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 2
                    remainingFunds -= 750
                }
                else {
                    starterCars.cars[selectedCar].acceleration -= 2
                    remainingFunds += 750
                }
            }
        )
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        resetDisplay()
                        if selectedCar < starterCars.cars.count-1 {
                            selectedCar += 1
                        }
                        else {
                            selectedCar = 0
                        }
                    })
                }
                Section {
                    Toggle("Exhaust Package ($500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tire Package ($500)", isOn: tirePackageBinding)
                        .disabled(!tirePackageEnabled)
                    Toggle("Engine Package ($750)", isOn: enginePackageBinding)
                        .disabled(!enginePackageEnabled)
                }
                
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
            }
        }
    func resetDisplay() {
        exhaustPackage = false
        tirePackage = false
        enginePackage = false
        remainingFunds = 1000
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

