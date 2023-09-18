//
//  ContentView.swift
//  ConvertIt!
//
//  Created by Jorge Pardo on 17/9/23 as part of the HWSUI course.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.yards
    @State var selectedUnits = 0
    @FocusState private var inputIsFocused : Bool

    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    
    let unitTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    

    let formatter : MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Monto", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                } header: {
                    Text("Monto a convertir")
                }
                
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(0..<conversions.count) {
                        Text(conversions[$0])
                    }
                }

                Picker("Convert from", selection: $inputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }

                Picker("Convert to", selection: $outputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section {
                    Text (result)
                } header: {
                    Text("Resultado:")
                }
            }
            .navigationTitle("Distancias:")
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    inputIsFocused = false
                }
            }
        }
        .onChange(of: selectedUnits) { newSelection in
            let units = unitTypes[newSelection]
            inputUnit = units[0]
            outputUnit = units[1]
        }
    }
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

#Preview {
    ContentView()
}
