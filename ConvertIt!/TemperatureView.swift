//
//  ContentView.swift
//  ConvertIt!
//
//  Created by Jorge Pardo on 17/9/23 as part of the HWSUI course.
//

import SwiftUI

struct TemperatureView: View {
    @State private var inputNumber = 100.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Kelvin"
    
    let units = ["Celsius", "Fahranheit", "Kelvin"]
    
    
    var body: some View {
        NavigationView {
            Form {
                //                Section {
                //                    TextField("Introduce un valor", value: $inputNumber, format: .number)
                //                        .keyboardType(.decimalPad)
                //                } header: {
                //                    Text("Monto a convertir")
                //                }
                //                Picker("Unidad de entrada", selection: $inputUnit)
                //                    ForEach(units, id: \.self) {
                //                        Text("\($0)")
                //                    }
                //                }
                //                Picker("Unidad de salida", selection: $outputUnit)
                //                    ForEach(units, id: \.self) {
                //                        Text("\($0)")
                //                    }
                //                }
                //        
                //                Section {
                //                    Text("Resultado")
                
            }
        }
    }
    
    #Preview {
        TemperatureView()
    }
}
