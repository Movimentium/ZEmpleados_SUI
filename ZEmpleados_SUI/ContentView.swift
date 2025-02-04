//  ContentView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = EmpleadosVM()
    
    var body: some View {
        NavigationStack {
            List(vm.empleados) { empleado in
                HStack {
                    VStack(alignment: .leading) {
                        Text(empleado.fullName)
                            .font(.headline)
                        Text(empleado.email)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    // TODO: AsyncImage

                }
            }
            .navigationTitle("Empleados")
        }
        
    }
}

#Preview {
    ContentView(vm: EmpleadosVM(networkInteractor: DataTestInteractor()))
}
